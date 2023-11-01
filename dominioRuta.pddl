(define (domain package-delivery)
  (:requirements :typing :negative-preconditions)
  (:types
    location
    package
    vehicle
    drone
  )

  (:predicates
    (at-drone ?d - drone ?l - location)     ; Predicado para la ubicación del dron 
    (at-vehicle ?v - vehicle ?l - location)  ; Predicado para la ubicación del vehículo
    (at-package ?l - location ?p - package)   ; Predicado para la ubicación del paquete
    (in ?p - package ?v - vehicle)
    (in-drone ?p - package ?d - drone)           ; Predicado para rastrear si un paquete está en un vehículo
    (connected ?l - location ?to - location)
    (empty-drone ?d - drone);Predicado del Dron vacio
)

  ;Vehicle Methods
  (:action load-package
    :parameters
    (?p - package
     ?l - location
     ?v - vehicle)

    :precondition
    (and
      (at-vehicle ?v ?l)       ; El vehículo debe estar en la ubicación
      (at-package ?l ?p)       ; El paquete debe estar en la ubicación
      (not (in ?p ?v))
    )

    :effect
    (and
      (in ?p ?v)
      (not (at-package ?l ?p))  ; El paquete ya no está en la ubicación
    )
  )

  (:action unload-package
    :parameters
    (?p - package
     ?l - location
     ?v - vehicle)

    :precondition
    (and
      (at-vehicle ?v ?l)   ; El vehículo debe estar en la ubicación
      (in ?p ?v)            ; El paquete debe estar en el vehículo
    )

    :effect
    (and
      (not (in ?p ?v))
      (at-package ?l ?p)  ; El paquete ahora está en la ubicación
    )
  )

  (:action travel
    :parameters
    (?l - location
     ?to - location
     ?v - vehicle)

    :precondition
    (and
      (at-vehicle ?v ?l)  ; El vehículo debe estar en la ubicación de inicio
      (connected ?l ?to)
    )
    
    :effect
    (and
      (at-vehicle ?v ?to)    ; El vehículo se mueve a la ubicación de destino
      (not (at-vehicle ?v ?l))
    )
  )

  ;Drone Methods
  (:action load-drone
      :parameters (
        ?p - package
        ?l - location
        ?d - drone
      )
      :precondition (and
        (at-drone ?d ?l)       ; El vehículo debe estar en la ubicación
        (at-package ?l ?p)
        (empty-drone ?d)
      )
      :effect (and
      (in-drone ?p ?d)
      (not (at-package ?l ?p))
      (not (empty-drone ?d))
      )
  )
  
  (:action unload-drone
      :parameters (
        ?p - package
        ?l - location
        ?d - drone
      )
      :precondition (and
        (at-drone ?d ?l)   ; El vehículo debe estar en la ubicación
        (in-drone ?p ?d)
        (not(empty-drone ?d))
      )
      :effect (and
      (not(in-drone ?p ?d))
      (at-package ?l ?p)
      (empty-drone ?d)
      )
  )

  (:action fly-drone
    :parameters
    (?l - location
     ?to - location
     ?d - drone)

    :precondition
    (and
      (at-drone ?d ?l)  ; El dron debe estar en la ubicación de inicio 
    )
    
    :effect
    (and
      (at-drone ?d ?to)    ; El dron se mueve a la ubicación de destino
      (not (at-drone ?d ?l))
    )
  )

)