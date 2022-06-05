#lang racket

(provide classify)

(define (list-of-factors n)
  (for/list ([i (inclusive-range 1 (quotient n 2))]
             #:when (= 0 (modulo n i)))
               i))

(define (aliquot-sum-via-for n)
  (for/sum ([i (list-of-factors n)])
    i))

(define (aliquot-sum-via-apply n)
  (apply + (list-of-factors n)))

(define (aliquot-sum-via-foldl n)
  (foldl + 0 (list-of-factors n)))

(define aliquot-sum
  aliquot-sum-via-foldl)
  ;aliquot-sum-via-for)
  ;aliquot-sum-via-apply)

(define (classify n)
  (define perfect (aliquot-sum n))
  (cond
    [(= n perfect) 'perfect]
    [(> n perfect) 'deficient]
    [(< n perfect) 'abundant]))


