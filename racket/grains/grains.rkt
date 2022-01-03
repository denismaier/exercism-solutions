#lang racket

(provide square total)

(define (square sq)
    (cond
      [(not (number? sq)) "please enter a number"]
      [(> sq 64) "There are only 64 squares"]
      [(= sq 1) 1]
      [else (* 2 (square (- sq 1)))]))


(define (total-on-board-with-square sq)
   (cond
      [(not (number? sq)) "please enter a number"]
      [(> sq 64) "There are only 64 squares"]
      [(= sq 1) (square 1)]
      [else (+ (square sq) (total-on-board-with-square (- sq 1)))]))
  
(define (total)
    (total-on-board-with-square 64))