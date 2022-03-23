#lang racket

(provide score)

; helper for association list access

(define (get-value value list)
   (cdr (assoc value list)))

; recursive solution via association list

(define values-per-string
  '(("a" . 1)
    ("e" . 1)
    ("i" . 1)
    ("o" . 1)
    ("u" . 1)
    ("l" . 1)
    ("n" . 1)
    ("r" . 1)
    ("s" . 1)
    ("t" . 1)
    ("d" . 2)
    ("g" . 2)
    ("b" . 3)
    ("c" . 3)
    ("m" . 3)
    ("p" . 3)
    ("f" . 4)
    ("h" . 4)
    ("v" . 4)
    ("w" . 4)
    ("y" . 4)
    ("k" . 5)
    ("j" . 8)
    ("x" . 8)
    ("q" . 10)
    ("z" . 10)))

(define (score-via-recursion word)
  (define word-normalized (string-downcase word))
  (define (worker word acc)
    (cond
      [(string=? word "") acc]
      [else
       (worker
        (substring word 1)
        (+ acc (get-value (substring word 0 1) values-per-string)))]))
  (worker word-normalized 0))

; for/sum solution via association list

(define values-per-char
  '((#\a . 1)
    (#\e . 1)
    (#\i . 1)
    (#\o . 1)
    (#\u . 1)
    (#\l . 1)
    (#\n . 1)
    (#\r . 1)
    (#\s . 1)
    (#\t . 1)
    (#\d . 2)
    (#\g . 2)
    (#\b . 3)
    (#\c . 3)
    (#\m . 3)
    (#\p . 3)
    (#\f . 4)
    (#\h . 4)
    (#\v . 4)
    (#\w . 4)
    (#\y . 4)
    (#\k . 5)
    (#\j . 8)
    (#\x . 8)
    (#\q . 10)
    (#\z . 10)))

(define (score-via-for word)
  (define word-normalized (string-downcase word))
  (for/sum ([c (in-string word-normalized)])
    (get-value c values-per-char)))

; solution using a more human friendly input

(define values-per-char-grouped
  '(((#\a #\e #\i #\o #\u #\l #\n #\r #\s #\t) 1)
    ((#\d #\g) 2)
    ((#\b #\c #\m #\p) 3)
    ((#\f #\h"#\v"#\w #\y) 4)
    ((#\k) 5)
    ((#\j #\x) 8)
    ((#\q #\z) 10)
    ))

(define (alist->hash alist)
  (for*/hash ([category alist]
              [key (first category)])
    (values key (second category))))

(define (score-via-for-from-hash word)
  (define word-normalized (string-downcase word))
  (for/sum ([c (in-string word-normalized)])
    (hash-ref (alist->hash values-per-char-grouped) c 0)))

(define score score-via-for-from-hash)