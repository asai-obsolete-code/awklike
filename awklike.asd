#|
  This file is a part of awklike project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#

#|
  Author: Masataro Asai (guicho2.71828@gmail.com)
|#



(in-package :cl-user)
(defpackage awklike-asd
  (:use :cl :asdf))
(in-package :awklike-asd)


(defsystem awklike
  :version "0.1"
  :author "Masataro Asai"
  :mailto "guicho2.71828@gmail.com"
  :license "LLGPL"
  :depends-on (:optima.ppcre :alexandria :iterate :lisp-namespace)
  :components ((:module "src"
                :components
                ((:file "package"))))
  :description ""
  :in-order-to ((test-op (load-op awklike.test))))
