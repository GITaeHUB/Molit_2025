; Auto-generated. Do not edit!


(cl:in-package planning-msg)


;//! \htmlinclude PathReferenceElement.msg.html

(cl:defclass <PathReferenceElement> (roslisp-msg-protocol:ros-message)
  ((pose
    :reader pose
    :initarg :pose
    :type geometry_msgs-msg:Pose
    :initform (cl:make-instance 'geometry_msgs-msg:Pose))
   (mode
    :reader mode
    :initarg :mode
    :type cl:fixnum
    :initform 0))
)

(cl:defclass PathReferenceElement (<PathReferenceElement>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <PathReferenceElement>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'PathReferenceElement)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name planning-msg:<PathReferenceElement> is deprecated: use planning-msg:PathReferenceElement instead.")))

(cl:ensure-generic-function 'pose-val :lambda-list '(m))
(cl:defmethod pose-val ((m <PathReferenceElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planning-msg:pose-val is deprecated.  Use planning-msg:pose instead.")
  (pose m))

(cl:ensure-generic-function 'mode-val :lambda-list '(m))
(cl:defmethod mode-val ((m <PathReferenceElement>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader planning-msg:mode-val is deprecated.  Use planning-msg:mode instead.")
  (mode m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <PathReferenceElement>) ostream)
  "Serializes a message object of type '<PathReferenceElement>"
  (roslisp-msg-protocol:serialize (cl:slot-value msg 'pose) ostream)
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <PathReferenceElement>) istream)
  "Deserializes a message object of type '<PathReferenceElement>"
  (roslisp-msg-protocol:deserialize (cl:slot-value msg 'pose) istream)
    (cl:setf (cl:ldb (cl:byte 8 0) (cl:slot-value msg 'mode)) (cl:read-byte istream))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<PathReferenceElement>)))
  "Returns string type for a message object of type '<PathReferenceElement>"
  "planning/PathReferenceElement")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'PathReferenceElement)))
  "Returns string type for a message object of type 'PathReferenceElement"
  "planning/PathReferenceElement")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<PathReferenceElement>)))
  "Returns md5sum for a message object of type '<PathReferenceElement>"
  "03dbb4113f1f5815afcc98e104844d0b")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'PathReferenceElement)))
  "Returns md5sum for a message object of type 'PathReferenceElement"
  "03dbb4113f1f5815afcc98e104844d0b")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<PathReferenceElement>)))
  "Returns full string definition for message of type '<PathReferenceElement>"
  (cl:format cl:nil "geometry_msgs/Pose pose~%uint8 mode~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'PathReferenceElement)))
  "Returns full string definition for message of type 'PathReferenceElement"
  (cl:format cl:nil "geometry_msgs/Pose pose~%uint8 mode~%================================================================================~%MSG: geometry_msgs/Pose~%# A representation of pose in free space, composed of position and orientation. ~%Point position~%Quaternion orientation~%~%================================================================================~%MSG: geometry_msgs/Point~%# This contains the position of a point in free space~%float64 x~%float64 y~%float64 z~%~%================================================================================~%MSG: geometry_msgs/Quaternion~%# This represents an orientation in free space in quaternion form.~%~%float64 x~%float64 y~%float64 z~%float64 w~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <PathReferenceElement>))
  (cl:+ 0
     (roslisp-msg-protocol:serialization-length (cl:slot-value msg 'pose))
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <PathReferenceElement>))
  "Converts a ROS message object to a list"
  (cl:list 'PathReferenceElement
    (cl:cons ':pose (pose msg))
    (cl:cons ':mode (mode msg))
))
