(define (problem problem_reg) (:domain domain_reg)

(:init
    (=(pressioneAttuale)0)
    (=(pressioneTarget)100)
    (=(bandaMorta)10)
    (acceso)
    (=(tempo)0)
    (=(contaAperturaPilota0)0)
)

(:goal (and
    (> (pressioneAttuale) 100 )
    (not(pilota0Aperto))
    (=(contaAperturaPilota0)4)
))


)
