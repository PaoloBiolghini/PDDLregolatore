;Header and description

(define (domain domain_reg)
    (:requirements :time)





(:predicates ;todo: define predicates here
(acceso)
(membranaUp)
(pilota0Aperto)
(pilota1Aperto)
)


(:functions 
    (pressioneAttuale)
    (pressioneTarget)
    (bandaMorta)
    (tempo)
    (istanteApertura)
    (tempoApertura)
    (contaAperturaPilota0)

)

(:process IncrementoTempo
    :parameters ()
    :precondition (acceso)
    :effect (and
        (increase (tempo) (* #t 1.0))
    )
)

(:process process_name
    :parameters ()
    :precondition (and
        (acceso) (pilota0Aperto)
    )
    :effect (and
        (increase (tempoApertura) (* #t 1.0))
    )
)


(:process aumentoPressione
    :parameters ()
    :precondition (and (>(tempoApertura) 1)
        (pilota0Aperto) (acceso) 
    )
    :effect (and 
        (increase (pressioneAttuale) (* #t 6))
    )
)

(:action aperturaPilota0
    :parameters ()
    :precondition (and (not(pilota0Aperto)) (not(pilota1Aperto)) )
    :effect (and (pilota0Aperto) (assign  (istanteApertura) tempo) (assign (tempoApertura) 0) (increase (contaAperturaPilota0) 1) )
)

(:action aperturaPilota1
    :parameters ()
    :precondition (and (not(pilota0Aperto)) (not(pilota1Aperto)) )
    :effect (and (pilota1Aperto) (assign  (istanteApertura) tempo) (assign (tempoApertura) 0) )
)

(:action chiusuraPilota0
    :parameters ()
    :precondition (and (pilota0Aperto) (>(tempoApertura) 2) )
    :effect (and (not(pilota0Aperto)) )
)


(:action chiusuraPilota1
    :parameters ()
    :precondition (and (pilota1Aperto) (>(tempoApertura) 2) )
    :effect (and (not(pilota1Aperto)) )
)




)