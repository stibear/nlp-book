#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear
|#

(in-package :nlp-book)

(defmacro aif (test then &optional else)
  `(let ((it ,test))
     (if it ,then ,else)))
