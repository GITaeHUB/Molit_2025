cmake_minimum_required(VERSION 3.0.2)
project(main)

find_package(catkin REQUIRED COMPONENTS
  rospy
  gps
  planning
)

catkin_package(
  CATKIN_DEPENDS rospy gps planning
)