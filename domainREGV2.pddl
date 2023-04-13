;Header and description

(define (domain domain_reg_nuovo)

;remove requirements that are not needed






; un-comment following line if constants are needed
;(:constants )

(:predicates ;todo: define predicates here
    (acceso)
    (pilota0Aperto)
    (pilota1Aperto)
    (isMembranaUp)
)

(:functions
    (tempo)
    (pressione)

    (pressioneMassima)
    (pressinoeThreshold)
    ;caratterizzazione membrana in salita
    (tempoMembranaUp)
    (pressioneCollaterale)
    ;caratterizzazione della relazione Tapertura Delta pression
    (incrementoLineare)
    ;definizione della sommatoria
    (massimoIncrementoSalita)
    (decrementoLineareSalita)
    (deltaPressioneIncrementoSalita)
    
)

(:process IncrementoTempo
    :parameters ()
    :precondition (acceso)
    :effect (and
        (increase (tempo) (* #t 1.0))
    )
)

(:process incrementoTempoApertura
    :parameters ()
    :precondition (and
        (pilota0Aperto)
    )
    :effect (and
        (increase (tempoApertura) (* #t 1.0))
    )
)

(:process incrementoTempoAperturaUscita
    :parameters ()
    :precondition (and
        (pilota1Aperto)
    )
    :effect (and
        (increase (tempoApertura) (* #t 1.0))
    )
)

(:event salitaMembrana
    :parameters ()
    :precondition (and
        (not(isMembranaUp)) (>(tempoApertura) tempoMembranaUp)
    )
    :effect (and
        (isMembranaUp) (assign (tempoApertura) 0) (increase (pressione) pressioneCollaterale)
    )
)


(:process aumentoLineareOverThreshold
    :parameters ()
    :precondition (and
        (pilota0Aperto) (isMembranaUp) (>(tempoApertura)3) (> (- pressioneMassima pressione) pressinoeThreshold)
    )
    :effect (and
        (increase (pressione) (* #t incrementoLineare))
    )
)

(:process aumentoLineareUnderThreshold
    :parameters ()
    :precondition (and
        (pilota0Aperto) (isMembranaUp) (>(tempoApertura)3) (<= (- pressioneMassima pressione) pressinoeThreshold)
    )
    :effect (and
        (increase (pressione) (* #t (* incrementoLineare (/ (- massimoIncrementoSalita (* decrementoLineareSalita (/ (- pressione pressinoeThreshold) deltaPressioneIncrementoSalita))) massimoIncrementoSalita))))
    )
)





(:action apriPilota0
    :parameters ()
    :precondition (and (not(pilota0Aperto)) (not(pilota1Aperto)) )
    :effect (and (pilota0Aperto) (assign (tempoApertura) 0))
)

(:action chiudiPilota0
    :parameters ()
    :precondition (and (pilota0Aperto) (>(tempoApertura)3) (isMembranaUp))
    :effect (and (not(pilota0Aperto)) )
)



)