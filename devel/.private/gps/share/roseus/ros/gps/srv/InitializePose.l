;; Auto-generated. Do not edit!


(when (boundp 'gps::InitializePose)
  (if (not (find-package "GPS"))
    (make-package "GPS"))
  (shadow 'InitializePose (find-package "GPS")))
(unless (find-package "GPS::INITIALIZEPOSE")
  (make-package "GPS::INITIALIZEPOSE"))
(unless (find-package "GPS::INITIALIZEPOSEREQUEST")
  (make-package "GPS::INITIALIZEPOSEREQUEST"))
(unless (find-package "GPS::INITIALIZEPOSERESPONSE")
  (make-package "GPS::INITIALIZEPOSERESPONSE"))

(in-package "ROS")





(defclass gps::InitializePoseRequest
  :super ros::object
  :slots (_request ))

(defmethod gps::InitializePoseRequest
  (:init
   (&key
    ((:request __request) nil)
    )
   (send-super :init)
   (setq _request __request)
   self)
  (:request
   (&optional (__request :null))
   (if (not (eq __request :null)) (setq _request __request)) _request)
  (:serialization-length
   ()
   (+
    ;; bool _request
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _request
       (if _request (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _request
     (setq _request (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass gps::InitializePoseResponse
  :super ros::object
  :slots (_success ))

(defmethod gps::InitializePoseResponse
  (:init
   (&key
    ((:success __success) nil)
    )
   (send-super :init)
   (setq _success __success)
   self)
  (:success
   (&optional (__success :null))
   (if (not (eq __success :null)) (setq _success __success)) _success)
  (:serialization-length
   ()
   (+
    ;; bool _success
    1
    ))
  (:serialize
   (&optional strm)
   (let ((s (if strm strm
              (make-string-output-stream (send self :serialization-length)))))
     ;; bool _success
       (if _success (write-byte -1 s) (write-byte 0 s))
     ;;
     (if (null strm) (get-output-stream-string s))))
  (:deserialize
   (buf &optional (ptr- 0))
   ;; bool _success
     (setq _success (not (= 0 (sys::peek buf ptr- :char)))) (incf ptr- 1)
   ;;
   self)
  )

(defclass gps::InitializePose
  :super ros::object
  :slots ())

(setf (get gps::InitializePose :md5sum-) "73febd61b8e953d7433f73e2e36e8177")
(setf (get gps::InitializePose :datatype-) "gps/InitializePose")
(setf (get gps::InitializePose :request) gps::InitializePoseRequest)
(setf (get gps::InitializePose :response) gps::InitializePoseResponse)

(defmethod gps::InitializePoseRequest
  (:response () (instance gps::InitializePoseResponse :init)))

(setf (get gps::InitializePoseRequest :md5sum-) "73febd61b8e953d7433f73e2e36e8177")
(setf (get gps::InitializePoseRequest :datatype-) "gps/InitializePoseRequest")
(setf (get gps::InitializePoseRequest :definition-)
      "bool request
---
bool success
")

(setf (get gps::InitializePoseResponse :md5sum-) "73febd61b8e953d7433f73e2e36e8177")
(setf (get gps::InitializePoseResponse :datatype-) "gps/InitializePoseResponse")
(setf (get gps::InitializePoseResponse :definition-)
      "bool request
---
bool success
")



(provide :gps/InitializePose "73febd61b8e953d7433f73e2e36e8177")


