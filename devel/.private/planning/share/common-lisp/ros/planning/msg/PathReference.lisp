; Auto-generated. Do not edit!


(cl:in-package planning-msg)


;//! \htmlinclude PathReference.msg.html

(cl:defclass <PathReference> (roslisp-msg-protocol:ros-message)
  ((path
    :reader path
    :initarg :path
    :type (cl:vector planning-msg:PathReferenceElement)
   :initform (cl:make-array 0 :element-type 'planning-msg:PathReferenceElement :initial-element (cl:make-instance 'planning-msg:PathReferenceElement))))
)

(cl:defclass PathReference (<PathReference>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathReference>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathReference)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name planning-msg:<PathReference> is deprecated: use planning-msg:PathReference instead.")))

(cl:ensure-generic-function 'path-val :lambda-list '(m))
(cl:defmethod path-val ((m <PathReference>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planning-msg:path-val is deprecated.  Use planning-msg:path instead.")
  (path m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathReference>) ostream)
  "Serializes a message object of type '<PathReference>"
  (cl:let ((__ros_arr_len (cl:length (cl:slot-value msg 'path))))
    (cl:write-byte (cl:ldb (cl:byte 8 0) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 8) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 16) __ros_arr_len) ostream)
    (cl:write-byte (cl:ldb (cl:byte 8 24) __ros_arr_len) ostream))
  (cl:map cl:nil #'(cl:lambda (ele) (roslisp-msg-protocol:serialize ele ostream))
   (cl:slot-value msg 'path))
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathReference>) istream)
  "Deserializes a message object of type '<PathReference>"
  (cl:let ((__ros_arr_len 0))
    (cl:setf (cl:ldb (cl:byte 8 0) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 8) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 16) __ros_arr_len) (cl:read-byte istream))
    (cl:setf (cl:ldb (cl:byte 8 24) __ros_arr_len) (cl:read-byte istream))
  (cl:setf (cl:slot-value msg 'path) (cl:make-array __ros_arr_len))
  (cl:let ((vals (cl:slot-value msg 'path)))
    (cl:dotimes (i __ros_arr_len)
    (cl:setf (cl:aref vals i) (cl:make-instance 'planning-msg:PathReferenceElement))
  (roslisp-msg-protocol:deserialize (cl:aref vals i) istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathReference>)))
  "Returns string type for a message object of type '<PathReference>"
  "planning/PathReference")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathReference)))
  "Returns string type for a message object of type 'PathReference"
  "planning/PathReference")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathReference>)))
  "Returns md5sum for a message object of type '<PathReference>"
  "373808cfe5239db879670ef6db7c7750")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathReference)))
  "Returns md5sum for a message object of type 'PathReference"
  "373808cfe5239db879670ef6db7c7750")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathReference>)))
  "Returns full string definition for message of type '<PathReference>"
  (cl:format cl:nil "PathReferenceElement[] path~%================================================================================~%MSG: planning/PathReferenceElement~%geometry_msgs/Pose pose~%uint8 mode~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathReference)))
  "Returns full string definition for message of type 'PathReference"
  (cl:format cl:nil "PathReferenceElement[] path~%================================================================================~%MSG: planning/PathReferenceElement~%geometry_msgs/Pose pose~%uint8 mode~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathReference>))
  (cl:+ 0
     4 (cl:reduce #'cl:+ (cl:slot-value msg 'path) :key #'(cl:lambda (ele) (cl:declare (cl:ignorable ele)) (cl:+ (roslisp-msg-protocol:serialization-length ele))))
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathReference>))
  "Converts a ROS message object to a list"
  (cl:list 'PathReference
    (cl:cons ':path (path msg))
))
