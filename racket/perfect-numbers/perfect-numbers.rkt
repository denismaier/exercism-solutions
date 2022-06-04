#lang racket

(provide classify)

(define (aliquot-sum n)
  (for/sum ([i
             (for/list ([i (range 1 (- n 1))]
             #:when (= 0 (modulo n i)))
               i)])
    i))

(define (classify n)
  (define perfect (aliquot-sum n))
  (cond
    [(= n perfect) 'perfect]
    [(> n perfect) 'deficient]
    [(< n perfect) 'abundant]))


