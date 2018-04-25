(define cone-facts
  (lambda (r h)
    ( list (* 3.14 (/ 1 3) (* r r) h)
      (+
       (* 3.14 (* r r))
       (* 3.14 r (sqrt (+ (* r r) (* h h))))))
)
)

(define double-rotate
  (lambda (theList)
    (cond
     ( (equal? (length theList) 2) (append (cdr theList)
                                           (list (car theList) )) )
     ( (equal? (length theList) 3) (list (car (cdr (cdr theList)))
                                  (car (cdr theList)) (car theList)))
     ( else     (append (cdr (cdr theList))
                        (list (car (cdr theList)) (car theList))))
     )

)
  )
(define slice
  (lambda (theList start end)
    ( (cond
        ( (equal? (length theList) 1) (car theList) )
        ( (< start end)
          (list (car theList) (slice (cdr theList) (+ start 1) ( + end 1) )))
        (else (null))
      )
)

)
)

(define remove-first
  (lambda (theList toremove)
    (cond
     ( (equal? (length theList) 1) (theList) ) )
    ( (equal? (car theList) toremove) (cdr theList) )
    (list car(theList) (remove-first (cdr theList) toremove))
)
)
(define perfect-squares
  (lambda (theList)
    (map (lambda (x) (* x x)) (filter integer? (map sqrt theList)))
)
)

(define avg
  (lambda (theList)
    ( / (apply + theList) (length theList)
)))

(define sd
 (lambda (theList)
   (sqrt ( / (apply +
         ( map (lambda (x) (* (- x (avg theList))(- x (avg theList)))) theList)\
)
             (- (length theList) 1)))
)
)
