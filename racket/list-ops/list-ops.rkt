#lang racket

(provide my-length
         my-reverse
         my-map
         my-filter
         my-fold
         my-append
         my-concatenate)

(define (my-length sequence)
  (cond
    [(empty? sequence) 0]
    [else (add1 (my-length (cdr sequence)))]))

(define (my-reverse sequence) ; better to use a tail recursive version here
  (define (worker sequence acc)
    (cond
      [(empty? sequence) acc]
      [else (worker (rest sequence) (cons (first sequence) acc))]))
  (worker sequence '()))
      
(define (my-reverse2 sequence) ; simple, but fails for larger lists
  (cond
    [(empty? sequence) empty]
    [else
     (append  (my-reverse2 (cdr sequence)) (list (car sequence)))]))

(define (my-map operation sequence)
  (cond
    [(empty? sequence) empty]
    [else (cons (operation (car sequence)) (my-map operation (cdr sequence)))]))

(define (my-filter operation? sequence)
  (cond
    [(empty? sequence) empty]
    [(operation? (car sequence)) (cons (car sequence) (my-filter operation? (cdr sequence)))]
    [else (my-filter operation? (cdr sequence))]))

(define (my-fold operation accumulator sequence)
  (cond
    [(empty? sequence) accumulator]
    [else
     (operation (car sequence) (my-fold operation accumulator (cdr sequence)))]))

(define (my-append2 sequence1 sequence2)
  (define (worker sequence acc)
    (cond
      [(empty? sequence) acc]
      [else (worker (cdr sequence) (cons (car sequence) acc))]))
  (worker (reverse sequence1) sequence2))

(define (my-append xs ys)
  (let worker ([lst (reverse xs)]
               [acc ys])
    (cond
      [(empty? lst) acc]
      [else (worker (cdr lst) (cons (car lst) acc))])))

(define (my-append3 xs ys)
  (match xs
    ['() ys]
    [(cons x xs) (cons x (my-append3 xs ys))]))

(define (my-concatenate2 list-of-lists)
  (foldr append empty list-of-lists))

(define (my-concatenate lol)
  (cond
    [(empty? lol) empty]
    (else (my-append (car lol) (my-concatenate (cdr lol))))))