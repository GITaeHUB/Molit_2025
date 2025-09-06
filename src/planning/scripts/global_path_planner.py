#! /usr/bin/env python3
# -*- coding: utf-8 -*-

import sys

import rospkg
import rospy
from geometry_msgs.msg import Pose, PoseStamped
from nav_msgs.msg import Path

from tf.transformations import quaternion_from_euler
import numpy as np

from planning.msg import PathReference, PathReferenceElement
from constant import Lane


class GlobalPathPlanner:
    def __init__(self, pkg_name: str):

        self.pkg_path = rospkg.RosPack().get_path(pkg_name)
        rospy.loginfo(f'pkg_path: {self.pkg_path}')

        self.g_path = dict()
        self.g_path1 = PathReference()
        self.g_path_pub = rospy.Publisher('/global_path', PathReference, queue_size=1)

        self.rviz_g_path1 = Path()
        self.rviz_g_path1.header.frame_id = 'map'
        self.rviz_g_path1.header.stamp = rospy.Time.now()
        self.rviz_g_path1_pub = rospy.Publisher('/rviz_global_path1', Path, queue_size=1)

        self.rviz_offset_x = 0
        self.rviz_offset_y = 0
        self.is_path_set = False

    def set_g_path(self, file_name: str): 
        with open(f'{self.pkg_path}/paths/{file_name}.txt', 'r') as f:
            for line in f.readlines():
                x, y, yaw, mode = map(float, line.split())
                quat = quaternion_from_euler(0., 0., yaw)
                
                
                g_path1_element = PathReferenceElement()
                g_path1_element.pose.position.x = x
                g_path1_element.pose.position.y = y
                g_path1_element.pose.position.z = 0.

                g_path1_element.pose.orientation.x = quat[0]
                g_path1_element.pose.orientation.y = quat[1]
                g_path1_element.pose.orientation.z = quat[2]
                g_path1_element.pose.orientation.w = quat[3]

                g_path1_element.mode = int(mode)
                self.g_path1.path.append(g_path1_element)

                if self.rviz_offset_x == 0 and self.rviz_offset_y == 0:
                    self.rviz_offset_x = g_path1_element.pose.position.x
                    self.rviz_offset_y = g_path1_element.pose.position.y

                rviz_pose = PoseStamped()

                rviz_pose.header.frame_id = 'map'
                rviz_pose.header.stamp = rospy.Time.now()

                rviz_pose.pose.position.x = x - self.rviz_offset_x
                rviz_pose.pose.position.y = y - self.rviz_offset_y
                rviz_pose.pose.position.z = 0.

                rviz_pose.pose.orientation.x = quat[0]
                rviz_pose.pose.orientation.y = quat[1]
                rviz_pose.pose.orientation.z = quat[2]
                rviz_pose.pose.orientation.w = quat[3]

                self.rviz_g_path1.poses.append(rviz_pose)

        self.g_path[Lane.ONE] = self.g_path1.path

        self.is_path_set = True

    def publish_global_path(self, curr_lane: Lane):
        self.g_path_pub.publish(self.g_path[curr_lane])

        self.rviz_g_path1_pub.publish(self.rviz_g_path1)