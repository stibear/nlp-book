#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear
|#

#|
  言語処理のための機械学習に掲載してあるもろもろを実装

  Author: stibear
|#

(in-package :cl-user)
(defpackage nlp-book-asd
  (:use :cl :asdf))
(in-package :nlp-book-asd)

(defsystem nlp-book
  :version "0.1"
  :author "stibear"
  :license ""
  :depends-on ()
  :components ((:module "src"
                :components
                ((:file "nlp-book"))))
  :description "言語処理のための機械学習に掲載してあるもろもろを実装"
  :long-description
  #.(with-open-file (stream (merge-pathnames
                             #p"README.markdown"
                             (or *load-pathname* *compile-file-pathname*))
                            :if-does-not-exist nil
                            :direction :input)
      (when stream
        (let ((seq (make-array (file-length stream)
                               :element-type 'character
                               :fill-pointer t)))
          (setf (fill-pointer seq) (read-sequence seq stream))
          seq)))
  :in-order-to ((test-op (test-op nlp-book-test))))