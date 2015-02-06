#|
  This file is a part of awklike project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#


(in-package :cl-user)
(defpackage awklike.test-asd
  (:use :cl :asdf))
(in-package :awklike.test-asd)


(defsystem awklike.test
  :author "Masataro Asai"
  :license "LLGPL"
  :depends-on (:awklike
               :fiveam)
  :components ((:module "t"
                :components
                ((:file "package"))))
  :perform (load-op :after (op c) ))
