;; Auto-generated. Do not edit!


(when (boundp 'planning::PathReferenceElement)
  (if (not (find-package "PLANNING"))
    (make-package "PLANNING"))
  (shadow 'PathReferenceElement (find-package "PLANNING")))
(unless (find-package "PLANNING::PATHREFERENCEELEMENT")
  (make-package "PLANNING::PATHREFERENCEELEMENT"))

(in-package "ROS")
;;//! \htmlinclude PathReferenceElement.msg.html
(if (not (find-package "GEOMETRY_MSGS"))
  (ros::roseus-add-msgs "geometry_msgs"))


(defclass planning::PathReferenceElement
  :super ros::object
  :slots (_pose _mode ))

(defmethod planning::PathReferenceElement
  (:init
   (&key
    ((:pose __pose) (instance geometry_msgs::Pose :init))
    ((:mode __mode) 0)
    )
   (send-super :init)
   (setq _pose __pose)
   (setq _mode (round __mode))
   self)
  (:pose
   (&rest __pose)
   (if (keywordp (car __pose))
       (send* _pose __pose)
     (progn
       (if __pose (setq _pose (car __pose)))
       _pose)))
  (:mode
   (&optional __mode)
   (if __mode (setq _mode __mode)) _mode)
  (:serialization-length
   ()
   (+
    ;; geometry_msgs/Pose _pose
    (send _pose :serialization-length)
    ;; uint8 _mode
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; geometry_msgs/Pose _pose
       (send _pose :serialize s)
     ;; uint8 _mode
       (write-byte _mode s)
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; geometry_msgs/Pose _pose
     (send _pose :deserialize buf ptr-) (incf ptr- (send _pose :serialization-length))
   ;; uint8 _mode
     (setq _mode (sys::peek buf ptr- :char)) (incf ptr- 1)
   ;;
   self)
  )

(setf (get planning::PathReferenceElement :md5sum-) "03dbb4113f1f5815afcc98e104844d0b")
(setf (get planning::PathReferenceElement :datatype-) "planning/PathReferenceElement")
(setf (get planning::PathReferenceElement :definition-)
      "geometry_msgs/Pose pose
uint8 mode
================================================================================
MSG: geometry_msgs/Pose
# A representation of pose in free space, composed of position and orientation. 
Point position
Quaternion orientation

================================================================================
MSG: geometry_msgs/Point
# This contains the position of a point in free space
float64 x
float64 y
float64 z

================================================================================
MSG: geometry_msgs/Quaternion
# This represents an orientation in free space in quaternion form.

float64 x
float64 y
float64 z
float64 w

")



(provide :planning/PathReferenceElement "03dbb4113f1f5815afcc98e104844d0b")


