#!/usr/bin/env python3
# -*- coding: utf-8 -*-

import sys
from pathlib import Path
import rospy

# ROS 메시지 타입과 MORAI UDP 라이브러리를 import 합니다.
from morai_msgs.msg import CtrlCmd

sys.path.append(str(Path(__file__).resolve().parents[1]))
try:
    from lib.network.UDP import Sender
    from lib.define.EgoCtrlCmd import EgoCtrlCmd
except ImportError:
    rospy.logerr("ERROR: MORAI UDP library not found.")
    rospy.logerr("Make sure 'lib' folder is in ~/Molit_2025-main/src/morai_control/")
    sys.exit(1)

class MoraiUdpControl:
    def __init__(self):
        rospy.init_node('morai_udp_controller', anonymous=True)

        # ROS 파라미터에서 IP와 Port 정보 가져오기 (launch 파일에서 설정 가능)
        ip = rospy.get_param('~ip', '127.0.0.1')
        port = rospy.get_param('~port', 9093)
        self.max_steer_angle = rospy.get_param('~max_steer_angle', 30.0)

        # MORAI UDP 통신 Sender 생성
        self.udp_sender = Sender(ip, port)

        # 제어 메시지(EgoCtrlCmd) 초기화
        self.cmd_msg = EgoCtrlCmd()
        self.cmd_msg.ctrl_mode = 2  # 2: AutoMode
        self.cmd_msg.gear = 4       # 4: Drive (D)
        self.cmd_msg.cmd_type = 2   # 2: Velocity control mode

        # 제어 명령을 수신할 Subscriber 생성
        # planning 노드에서 /ctrl_cmd 토픽을 발행한다고 가정
        rospy.Subscriber('/ctrl_cmd', CtrlCmd, self.cmd_callback)

        # 주기적으로 제어 명령을 전송하기 위한 타이머 설정 (20Hz)
        self.send_timer = rospy.Timer(rospy.Duration(1.0/20.0), self.send_cmd)

        rospy.loginfo("Morai UDP Controller Node is ready.")
        rospy.loginfo(f"Target IP: {ip}, Port: {port}")

    def cmd_callback(self, msg):
        """
        /ctrl_cmd 토픽을 구독하여 콜백이 호출될 때마다
        MORAI로 보낼 제어 메시지를 업데이트합니다.
        """
        # longlCmdType: 1: Throttle, 2: Velocity, 3: Acceleration
        if msg.longlCmdType == 2:
            self.cmd_msg.cmd_type = 2 # Velocity control
            self.cmd_msg.velocity = msg.velocity # km/h
            self.cmd_msg.accel = 0.0
            self.cmd_msg.brake = 0.0
        else: # Throttle control as default
            self.cmd_msg.cmd_type = 1 # Throttle control
            self.cmd_msg.velocity = 0.0
            self.cmd_msg.accel = msg.accel
            self.cmd_msg.brake = msg.brake

        # 조향값은 -1 ~ 1 사이로 정규화 필요 (morai_msgs/CtrlCmd는 degree 단위)
        # 최대 조향각이 30도라고 가정하고 정규화
        self.cmd_msg.steer = msg.steering / self.max_steer_angle

    def send_cmd(self, event):
        """
        타이머에 의해 주기적으로 호출되어 MORAI 시뮬레이터로 제어 명령을 전송합니다.
        """
        self.udp_sender.send(self.cmd_msg)

if __name__ == '__main__':
    try:
        udp_control = MoraiUdpControl()
        rospy.spin()  # 노드가 종료될 때까지 대기
    except rospy.ROSInterruptException:
        rospy.loginfo("Node terminated.")
    except Exception as e:
        rospy.logerr(f"An error occurred: {e}")
