#lang racket

(require "../lib/basic.rkt")

(define (sum-of-squares x y)
  (+ (square x)
     (square y)))

(define (f a b c)
  (max (sum-of-squares a b)
       (sum-of-squares b c)
       (sum-of-squares c a)))
(f 3 4 5) ;-> 41
(f 4 5 3) ;-> 41
(f 5 3 4) ;-> 41
