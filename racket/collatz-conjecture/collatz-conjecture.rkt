#lang racket

(provide collatz)

(define/contract (collatz num)
  (exact-positive-integer? . -> . exact-integer?)
  (define (handle-even num) (quotient num 2))
  (define (handle-odd num) (+ (* 3 num) 1))
  (let worker ([num num]
               [acc 0])
    (cond
      [(= num 1) acc]
      [(even? num) (worker (handle-even num) (add1 acc))]
      [else (worker (handle-odd num) (add1 acc))])))
  