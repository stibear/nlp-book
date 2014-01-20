#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear
|#

(in-package :nlp-book)

(defun vector-dot (v1 v2)
  (reduce #'+ (map 'vector #'* v1 v2)))

(defun vector-+ (v1 v2)
  (map 'vector #'+ v1 v2))

(defun vector-- (v1 v2)
  (map 'vector #'- v1 v2))

(defun vector-abs (vector)
  (expt (reduce #'+
		(map 'vector (lambda (x) (expt x 2)) vector))
	1/2))

(defun vector-angle (v1 v2)
  (acos (/ (vector-dot v1 v2)
	   (* (vector-abs v1) (vector-abs v2)))))
