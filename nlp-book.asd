#|
  This file is a part of nlp-book project.
  Copyright (c) 2014 stibear1996
|#

#|
  言語処理のための機械学習に掲載してあるもろもろを実装

  Author: stibear1996
|#

(in-package :cl-user)
(defpackage nlp-book-asd
  (:use :cl :asdf))
(in-package :nlp-book-asd)

(defsystem nlp-book
  :version "0.1"
  :author "stibear1996"
  :license "LLGPL"
  :depends-on (:iterate
	       :cl-annot
	       :cl-syntax
	       :cl-syntax-annot
	       )
  :components ((:module "src"
                :components
                ((:file "package")
		 (:module "util"
		  :components
		  ((:file "macro")
		   (:file "vector"))
		  :depends-on ("package"))
		 (:module "core"
		  :components
		  ((:file "agglomerative")
		   (:file "k-means"))
		  :depends-on ("package" "util"))
		 )))
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
