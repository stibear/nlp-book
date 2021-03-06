#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear1996
|#

(in-package :nlp-book)

(cl-syntax:use-syntax :annot)

@export
(defun agglomerative (vector cluster-number similarity-function
		      &optional (cluster-sim-func #'single-link))
  (let ((clusters (make-set vector)))
    (iter
      (while (< cluster-number (array-dimension clusters 0)))
      (let ((max -inf) x y
	    (length (array-dimension clusters 0)))
	(iter (for i below length)
	  (iter (for j below length)
	    (unless (= i j)
	      (let* ((cluster-i (aref clusters i))
		     (cluster-j (aref clusters j))
		     (sim (funcall cluster-sim-func
				   (cdr cluster-i)
				   (cdr cluster-j)
				   similarity-function)))
		(when (< max sim)
		  (setf max sim
			x i
			y j))))))
	(merge-tree (aref clusters x) (aref clusters y))
	(setf clusters (delete (aref clusters y) clusters))))
    (map 'vector #'cdr clusters)))

@export
(defun single-link (cluster1 cluster2 sim-func)
  (iter (for i in cluster1)
    (finding
     (iter (for j in cluster2)
       (finding (funcall sim-func i j) maximizing j))
     maximizing i)))

@export
(defun complete-link (cluster1 cluster2 sim-func)
  (iter (for i in cluster1)
    (finding
     (iter (for j in cluster2)
       (finding (funcall sim-func i j) minimizing j))
     minimizing i)))

@export
(defun centroid (cluster1 cluster2 sim-func)
  (flet ((avr (list)
	   (/ (reduce #'+ list) (list-length list))))
    (funcall sim-func (avr cluster1) (avr cluster2))))

(defun make-set (vector)
  (iter (for i below (array-dimension vector 0))
    (collect (list i (aref vector i)) result-type vector)))

(defun merge-tree (x y)
  (setf (cdr x) (append (cdr x) (cdr y))))
