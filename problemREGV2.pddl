(define (problem problem_reg_nuovo) (:domain domain_reg_nuovo)

(:init
    (acceso)
    (=(pressioneCollaterale)10)
    (=(incrementoLineare)5)
    (=(pressione)0)
    (=(tempoMembranaUp)20)
    (=(pressioneMassima)6000)
    (=(pressinoeThreshold)3200)
    (=(tempoApertura)0)
    (=(massimoIncrementoSalita) 120)
    (= (decrementoLineareSalita) 4)
    (=(deltaPressioneIncrementoSalita)90)
)

(:goal (and
    (>(pressione)5000)
))


)
