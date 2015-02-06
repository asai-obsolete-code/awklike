#|
  This file is a part of awklike project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage :awklike.test
  (:use :cl
        :awklike
        :fiveam
        :optima :alexandria :iterate :cl-ppcre))
(in-package :awklike.test)



(def-suite :awklike)
(in-suite :awklike)

;; run test with (run! test-name) 
;;   test as you like ...

(test awklike

  )


