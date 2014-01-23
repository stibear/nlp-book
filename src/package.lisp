#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear
|#

(in-package :cl-user)
(defpackage nlp-book
  (:use :cl :iterate))
(in-package :nlp-book)

(defconstant inf
  #+allegro   excl:*infinity-double*
  #+sbcl      sb-ext:double-float-positive-infinity
  #+(or lispworks clozure) +1D++0)

(defconstant -inf
  #+allegro   excl:*negative-infinity-double*
  #+sbcl      sb-ext:double-float-negative-infinity
  #+(or lispworks clozure) -1D++0)
