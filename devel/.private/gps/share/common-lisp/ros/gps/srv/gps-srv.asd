
(cl:in-package :asdf)

(defsystem "gps-srv"
  :depends-on (:roslisp-msg-protocol :roslisp-utils )
  :components ((:file "_package")
    (:file "InitializePose" :depends-on ("_package_InitializePose"))
    (:file "_package_InitializePose" :depends-on ("_package"))
  ))