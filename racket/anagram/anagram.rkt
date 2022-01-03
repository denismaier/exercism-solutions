#lang racket

(provide anagrams-for)

(define (anagram? string1 string2)
  (define (normalize-string string) (sort (string->list (string-downcase string)) char>?))
  (define string1-as-list (normalize-string string1))
  (define string2-as-list (normalize-string string2))
  (and 
    (equal? string1-as-list string2-as-list) 
    (not (equal? string1 string2))))

; recursive solution
(define (anagrams-for-recursive string los)
  (cond
    [(empty? los) '()]
    [(anagram? string (car los)) (cons (car los) (anagrams-for-recursive string (cdr los)))]
    [else (anagrams-for-recursive string (cdr los))]))

; higher order function
(define (anagrams-for-filter string los)
  (define (keep-el? el)
    (cond
      [(anagram? el string) #t]
      [else #f]))
    (filter keep-el? los))

; list comprehension
(define (anagrams-for-list-comprehension string los)
  (for/list ([word los]
              #:when (anagram? string word))
              word))

; select implementation to use
(define anagrams-for anagrams-for-filter)
;(define anagrams-for anagrams-for-recursion)
;(define anagrams-for anagrams-for-list-comprehension)
