#lang racket

(provide leap-year?)

(define (leap-year? year)
  (and (equal? 0 (remainder year 4))
       (or
        (not (equal? 0 (remainder year 100)))
        (equal? 0 (remainder year 400)))))