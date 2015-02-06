
;; cat data | /usr/local/bin/sbcl --load example.lisp -
;; /usr/local/bin/sbcl --load example.lisp data

(ql:quickload :awklike)
(use-package :awklike)

(awk BEGIN
  (print (cdr sb-ext:*posix-argv*))
  (print "hello!"))

(awk |-data|
  (print $2))

(main (cdr sb-ext:*posix-argv*))
(exit)
