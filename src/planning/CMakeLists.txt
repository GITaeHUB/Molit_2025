cmake_minimum_required(VERSION 3.0.2)
project(planning)

## 1. find_package에 message_generation 추가
find_package(catkin REQUIRED COMPONENTS
  rospy
  std_msgs
  geometry_msgs
  nav_msgs
  message_generation
)

## 2. add_message_files 추가 (사용할 .msg 파일 목록)
add_message_files(
  FILES
  PathReference.msg
  PathReferenceElement.msg
)

## 3. generate_messages 추가
generate_messages(
  DEPENDENCIES
  std_msgs geometry_msgs nav_msgs
)

## 4. catkin_package에 CATKIN_DEPENDS message_runtime 추가
catkin_package(
  CATKIN_DEPENDS rospy std_msgs geometry_msgs nav_msgs message_runtime
)

## 5. 기존에 있던 scripts 설치 부분 (이 부분은 그대로 두시면 됩니다)
catkin_install_python(PROGRAMS
  scripts/planner.py
  # path_maker.py는 launch 파일에서 사용되지 않으므로 설치하지 않아도 무방합니다.
  DESTINATION ${CATKIN_PACKAGE_BIN_DESTINATION}
)