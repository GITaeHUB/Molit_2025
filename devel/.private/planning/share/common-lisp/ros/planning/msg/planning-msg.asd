
(cl:in-package :asdf)

(defsystem "planning-msg"
  :depends-on (:roslisp-msg-protocol :roslisp-utils :geometry_msgs-msg
)
  :components ((:file "_package")
    (:file "PathReference" :depends-on ("_package_PathReference"))
    (:file "_package_PathReference" :depends-on ("_package"))
    (:file "PathReferenceElement" :depends-on ("_package_PathReferenceElement"))
    (:file "_package_PathReferenceElement" :depends-on ("_package"))
  ))