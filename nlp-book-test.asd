#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear
|#

(in-package :cl-user)
(defpackage nlp-book-test-asd
  (:use :cl :asdf))
(in-package :nlp-book-test-asd)

(defsystem nlp-book-test
  :author "stibear"
  :license ""
  :depends-on (:nlp-book
               :cl-test-more)
  :components ((:module "t"
                :components
                ((:test-file "nlp-book"))))

  :defsystem-depends-on (:cl-test-more)
  :perform (test-op :after (op c)
                    (funcall (intern #. (string :run-test-system) :cl-test-more)
                             c)
                    (asdf:clear-system c)))
