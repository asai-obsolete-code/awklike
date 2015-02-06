
# Awklike

This is an awk-like text processor.

## Usage

```lisp
#!/usr/local/bin/ros -s awklike

(awk BEGIN
  (format t "hello!"))

(awk /regexp/
  (princ $1))
```

## Dependencies
This library is at least tested on implementation listed below:

+ SBCL 1.2.1 on X86-64 Linux 3.13.0-45-generic (author's environment)

Also, it depends on the following libraries:

+ optima by *Tomohiro Matsuyama* :
    Optimized Pattern Matching Library
+ alexandria by ** :
    Alexandria is a collection of portable public domain utilities.
+ iterate by ** :
    Jonathan Amsterdam's iterator/gatherer/accumulator facility
+ cl-ppcre by ** :
    Perl-compatible regular expression library

## Installation

## Author

* Masataro Asai (guicho2.71828@gmail.com)

## Copyright

Copyright (c) 2015 Masataro Asai (guicho2.71828@gmail.com)

# License

Licensed under the LLGPL License.


