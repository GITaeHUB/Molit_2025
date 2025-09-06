#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
import os
sys.path.append(os.path.dirname(__file__))


import rospy
from global_path_planner import GlobalPathPlanner
from geometry_msgs.msg import Pose, PoseStamped
from tf.transformations import quaternion_from_euler
from constant import Lane

class Planner(object):
    def __init__(self, file_name):
        # roslaunch가 노드를 실행하므로, 스크립트 내에서 init_node를 호출할 필요가 없습니다.
        # rospy.init_node('planner', anonymous=True)
        self.rate = rospy.Rate(30)

        self.g_path_planner = GlobalPathPlanner('planning')
        self.g_path_planner.set_g_path(file_name)
        rospy.loginfo(f"Global path '{file_name}.txt' loaded.")

        self.rviz_curr_pose = PoseStamped()
        self.rviz_curr_pose.header.frame_id = 'map'
        self.rviz_curr_pose_pub = rospy.Publisher('/rviz_curr_pose', PoseStamped, queue_size=1)
        
        self.curr_pose = None
        rospy.Subscriber('/current_pose', Pose, self.curr_pose_callback)

    def curr_pose_callback(self, msg: Pose):
        self.curr_pose = msg

        self.rviz_curr_pose.header.stamp = rospy.Time.now()
        self.rviz_curr_pose.pose.position.x = self.curr_pose.position.x - self.g_path_planner.rviz_offset_x
        self.rviz_curr_pose.pose.position.y = self.curr_pose.position.y - self.g_path_planner.rviz_offset_y
        self.rviz_curr_pose.pose.orientation.x = self.curr_pose.orientation.x
        self.rviz_curr_pose.pose.orientation.y = self.curr_pose.orientation.y
        self.rviz_curr_pose.pose.orientation.z = self.curr_pose.orientation.z
        self.rviz_curr_pose.pose.orientation.w = self.curr_pose.orientation.w
        self.rviz_curr_pose_pub.publish(self.rviz_curr_pose)

if __name__ == "__main__":
    rospy.init_node('planner', anonymous=True)
    # sys.argv 대신 ROS 파라미터 서버에서 경로 파일 이름을 가져옵니다.
    try:
        # launch 파일에서 전달된 'path_name' 파라미터를 가져옵니다.
        path_file_name = rospy.get_param('~path_name')
        planner = Planner(path_file_name)
    except KeyError:
        # 파라미터가 없으면 오류 메시지를 출력하고 노드를 종료합니다.
        rospy.logerr("ERROR: 'path' argument is not set. Please provide it via roslaunch.")
        rospy.logerr("Usage: roslaunch main molit_system.launch path:=<your_path_name>")
        sys.exit(1)

    while not rospy.is_shutdown():
        if planner.g_path_planner.is_path_set and planner.curr_pose is not None:
            planner.g_path_planner.publish_global_path(Lane.ONE)

        planner.rate.sleep()
