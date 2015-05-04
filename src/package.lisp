#|
  This file is a part of awklike project.
  Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)
|#

(in-package :cl-user)
(defpackage awklike
  (:use :cl :optima :optima.ppcre :alexandria :iterate :cl-ppcre :lisp-namespace)
  (:export
   #:$0
   #:awk
   #:RUN
   #:BEGIN
   #:END
   #:UNBOUND-MATCHER
   #:SYMBOL-MATCHER
   #:MATCHER-BOUNDP
   #:matcher))
(in-package :awklike)

;; blah blah blah.

(define-namespace matcher (function (string list) t))

(eval-when (:compile-toplevel :load-toplevel :execute)
  ;; CLHS says CALL-ARGUMENTS-LIMIT is larger than 50
  (defvar *max-column* 50)
  (defmacro define-$-macros ()
    `(progn
       ,@(iter (for i from 1 below *max-column*)
               (for sym = (symbolicate "$" (princ-to-string i)))
               (appending
                `((define-symbol-macro ,sym
                      (nth ,(1- i) awk-arguments))
                  (export ',sym))))))
  (defmacro awk (key &body body)
    `(setf
      (symbol-matcher ',key)
      ,(match (symbol-name key)
         ((or "BEGIN" "END")
          `(lambda ($0)
             (declare (ignorable $0))
             (let ((awk-arguments (split "\\s+" $0)))
               (declare (ignorable awk-arguments))
               ,@body)))
         (regex
          `(lambda ($0)
             (declare (ignorable $0))
             (when (scan ,(format nil ".*~a.*" regex) $0)
               (let ((awk-arguments (split "\\s+" $0)))
                 (declare (ignorable awk-arguments))
                 ,@body))))))))

(define-$-macros)

(awk BEGIN)
(awk END)

(defun run (&optional (in-file "-"))
  (ematch in-file
    ("-"
     (read-loop))
    ((or (pathname) (string))
     (with-open-file (*standard-input* in-file)
       (read-loop)))))

(defun read-loop ()
  (funcall (symbol-matcher 'begin) nil)
  (iter (for line = (read-line *standard-input* nil nil))
        (while line)
        (search-match line))
  (funcall (symbol-matcher 'end) nil))

(defun search-match (line)
  (iter (for (key fn) in-hashtable *matcher-table*)
        (unless (or (eq key 'begin) (eq key 'end))
          (funcall fn line))))

  
