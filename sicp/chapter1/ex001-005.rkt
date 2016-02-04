#lang racket

(define (p) (p))
(define (test x y)
  (if (= x 0) 0 y))
;;; endless loop
;; (test 0 (p))
