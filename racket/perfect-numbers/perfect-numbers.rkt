#lang racket

(provide classify)

(define (aliquot-sum n)
  (for/sum ([i
             (for/list ([i (range 1 (- n 1))]
             #:when (= 0 (modulo n i)))
               i)])
    i))

(define (classify n)
  (cond
    [(= n (aliquot-sum n)) 'perfect]
    [(> n (aliquot-sum n)) 'deficient]
    [(< n (aliquot-sum n)) 'abundant]))


