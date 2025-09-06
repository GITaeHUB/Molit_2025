;; Auto-generated. Do not edit!


(when (boundp 'planning::PathReference)
  (if (not (find-package "PLANNING"))
    (make-package "PLANNING"))
  (shadow 'PathReference (find-package "PLANNING")))
(unless (find-package "PLANNING::PATHREFERENCE")
  (make-package "PLANNING::PATHREFERENCE"))

(in-package "ROS")
;;//! \htmlinclude PathReference.msg.html


(defclass planning::PathReference
  :super ros::object
  :slots (_path ))

(defmethod planning::PathReference
  (:init
   (&key
    ((:path __path) ())
    )
   (send-super :init)
   (setq _path __path)
   self)
  (:path
   (&rest __path)
   (if (keywordp (car __path))
       (send* _path __path)
     (progn
       (if __path (setq _path (car __path)))
       _path)))
  (:serialization-length
   ()
   (+
    ;; planning/PathReferenceElement[] _path
    (apply #'+ (send-all _path :serialization-length)) 4
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; planning/PathReferenceElement[] _path
     (write-long (length _path) s)
     (dolist (elem _path)
       (send elem :serialize s)
       )
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; planning/PathReferenceElement[] _path
   (let (n)
     (setq n (sys::peek buf ptr- :integer)) (incf ptr- 4)
     (setq _path (let (r) (dotimes (i n) (push (instance planning::PathReferenceElement :init) r)) r))
     (dolist (elem- _path)
     (send elem- :deserialize buf ptr-) (incf ptr- (send elem- :serialization-length))
     ))
   ;;
   self)
  )

(setf (get planning::PathReference :md5sum-) "373808cfe5239db879670ef6db7c7750")
(setf (get planning::PathReference :datatype-) "planning/PathReference")
(setf (get planning::PathReference :definition-)
      "PathReferenceElement[] path
================================================================================
MSG: planning/PathReferenceElement
geometry_msgs/Pose pose
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



(provide :planning/PathReference "373808cfe5239db879670ef6db7c7750")


