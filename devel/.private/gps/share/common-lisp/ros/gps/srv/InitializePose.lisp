; Auto-generated. Do not edit!


(cl:in-package gps-srv)


;//! \htmlinclude InitializePose-request.msg.html

(cl:defclass <InitializePose-request> (roslisp-msg-protocol:ros-message)
  ((request
    :reader request
    :initarg :request
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass InitializePose-request (<InitializePose-request>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitializePose-request>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitializePose-request)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gps-srv:<InitializePose-request> is deprecated: use gps-srv:InitializePose-request instead.")))

(cl:ensure-generic-function 'request-val :lambda-list '(m))
(cl:defmethod request-val ((m <InitializePose-request>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps-srv:request-val is deprecated.  Use gps-srv:request instead.")
  (request m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitializePose-request>) ostream)
  "Serializes a message object of type '<InitializePose-request>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'request) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitializePose-request>) istream)
  "Deserializes a message object of type '<InitializePose-request>"
    (cl:setf (cl:slot-value msg 'request) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitializePose-request>)))
  "Returns string type for a service object of type '<InitializePose-request>"
  "gps/InitializePoseRequest")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitializePose-request)))
  "Returns string type for a service object of type 'InitializePose-request"
  "gps/InitializePoseRequest")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitializePose-request>)))
  "Returns md5sum for a message object of type '<InitializePose-request>"
  "73febd61b8e953d7433f73e2e36e8177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitializePose-request)))
  "Returns md5sum for a message object of type 'InitializePose-request"
  "73febd61b8e953d7433f73e2e36e8177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitializePose-request>)))
  "Returns full string definition for message of type '<InitializePose-request>"
  (cl:format cl:nil "bool request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitializePose-request)))
  "Returns full string definition for message of type 'InitializePose-request"
  (cl:format cl:nil "bool request~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitializePose-request>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitializePose-request>))
  "Converts a ROS message object to a list"
  (cl:list 'InitializePose-request
    (cl:cons ':request (request msg))
))
;//! \htmlinclude InitializePose-response.msg.html

(cl:defclass <InitializePose-response> (roslisp-msg-protocol:ros-message)
  ((success
    :reader success
    :initarg :success
    :type cl:boolean
    :initform cl:nil))
)

(cl:defclass InitializePose-response (<InitializePose-response>)
  ())

(cl:defmethod cl:initialize-instance :after ((m <InitializePose-response>) cl:&rest args)
  (cl:declare (cl:ignorable args))
  (cl:unless (cl:typep m 'InitializePose-response)
    (roslisp-msg-protocol:msg-deprecation-warning "using old message class name gps-srv:<InitializePose-response> is deprecated: use gps-srv:InitializePose-response instead.")))

(cl:ensure-generic-function 'success-val :lambda-list '(m))
(cl:defmethod success-val ((m <InitializePose-response>))
  (roslisp-msg-protocol:msg-deprecation-warning "Using old-style slot reader gps-srv:success-val is deprecated.  Use gps-srv:success instead.")
  (success m))
(cl:defmethod roslisp-msg-protocol:serialize ((msg <InitializePose-response>) ostream)
  "Serializes a message object of type '<InitializePose-response>"
  (cl:write-byte (cl:ldb (cl:byte 8 0) (cl:if (cl:slot-value msg 'success) 1 0)) ostream)
)
(cl:defmethod roslisp-msg-protocol:deserialize ((msg <InitializePose-response>) istream)
  "Deserializes a message object of type '<InitializePose-response>"
    (cl:setf (cl:slot-value msg 'success) (cl:not (cl:zerop (cl:read-byte istream))))
  msg
)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql '<InitializePose-response>)))
  "Returns string type for a service object of type '<InitializePose-response>"
  "gps/InitializePoseResponse")
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitializePose-response)))
  "Returns string type for a service object of type 'InitializePose-response"
  "gps/InitializePoseResponse")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql '<InitializePose-response>)))
  "Returns md5sum for a message object of type '<InitializePose-response>"
  "73febd61b8e953d7433f73e2e36e8177")
(cl:defmethod roslisp-msg-protocol:md5sum ((type (cl:eql 'InitializePose-response)))
  "Returns md5sum for a message object of type 'InitializePose-response"
  "73febd61b8e953d7433f73e2e36e8177")
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql '<InitializePose-response>)))
  "Returns full string definition for message of type '<InitializePose-response>"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:message-definition ((type (cl:eql 'InitializePose-response)))
  "Returns full string definition for message of type 'InitializePose-response"
  (cl:format cl:nil "bool success~%~%~%"))
(cl:defmethod roslisp-msg-protocol:serialization-length ((msg <InitializePose-response>))
  (cl:+ 0
     1
))
(cl:defmethod roslisp-msg-protocol:ros-message-to-list ((msg <InitializePose-response>))
  "Converts a ROS message object to a list"
  (cl:list 'InitializePose-response
    (cl:cons ':success (success msg))
))
(cl:defmethod roslisp-msg-protocol:service-request-type ((msg (cl:eql 'InitializePose)))
  'InitializePose-request)
(cl:defmethod roslisp-msg-protocol:service-response-type ((msg (cl:eql 'InitializePose)))
  'InitializePose-response)
(cl:defmethod roslisp-msg-protocol:ros-datatype ((msg (cl:eql 'InitializePose)))
  "Returns string type for a service object of type '<InitializePose>"
  "gps/InitializePose")