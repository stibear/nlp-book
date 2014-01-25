#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear1996
|#

(in-package :nlp-book)

(cl-syntax:use-syntax :annot)

@export
(defun k-means (vector m-vector similarity-function)
  (let* ((k (array-dimension m-vector 0))
	 clusters)
    (symbol-macrolet
	((new-clusters
	   (let ((clusters (make-array k :initial-element nil)))
	     (iter (for i in-vector vector)
	       (push i
		     (aref clusters
			   (iter (for j below k)
			     (finding j
				      maximizing
				      (funcall similarity-function
					       i (aref m-vector j)))))))
	     clusters)))
      (iter
	(if (first-iteration-p)
	    (setf clusters new-clusters)
	    (let ((new-clusters new-clusters))
	      (when (every #'equal clusters new-clusters)
		(leave (map 'vector #'nreverse new-clusters)))))))))
