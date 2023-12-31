(define (problem package-delivery-problem)
  (:domain package-delivery)

  (:objects
    Oradea Zerid Arad Timisoara Lugoj Mehadia Dobreta Craiova Pitesti Rimnicu Sibiu Fagaras Bucharest Giurgiu Urziceni Hirsova Eforie Vaslui Iasi Neamt - location 
    Vehiculo1 Vehiculo2 Vehiculo3 Vehiculo4 - vehicle
    Paq1 Paq2 Paq3 Paq4 Paq5 Paq6 Paq7 Paq8 Paq9 Paq10 Paq11 Paq12 - package
    DronA DronB DronC - drone
  )

  (:init
    ;Ubicaciones de los vehiculos
    (at-vehicle Vehiculo1 Arad)
    (at-vehicle Vehiculo2 Fagaras)
    (at-vehicle Vehiculo3 Vaslui)
    (at-vehicle Vehiculo4 Giurgiu)

    ;Ubicaciones de los Drones 
    (empty-drone DronA)
    (empty-drone DronB)
    (empty-drone DronC)
    (at-drone DronA Oradea)
    (at-drone DronB Dobreta)
    (at-drone DronC Hirsova)
    

    ;Ubicaciones de los paquetes
    (at-package Arad Paq1) 
    (at-package Arad Paq2) 
    (at-package Arad Paq3) 
    (at-package Bucharest Paq4) 
    (at-package Timisoara Paq5) 
    (at-package Sibiu Paq6) 
    (at-package Fagaras Paq7) 
    (at-package Giurgiu Paq8) 
    (at-package Hirsova Paq9) 
    (at-package Eforie Paq10)
    (at-package Neamt Paq11)  
    (at-package Pitesti Paq12)  

    ;Conexiones no son bidireccionales por defecto segun mi poca experiencia
    (connected Zerid Oradea)
    (connected Sibiu Oradea)
    (connected Arad Zerid)
    (connected Sibiu Arad)
    (connected Timisoara Arad)
    (connected Lugoj Timisoara)
    (connected Mehadia Lugoj)
    (connected Dobreta Mehadia)
    (connected Craiova Dobreta)
    (connected Pitesti Craiova)
    (connected Rimnicu Craiova)
    (connected Bucharest Pitesti)
    (connected Rimnicu Pitesti)
    (connected Sibiu Rimnicu)
    (connected Fagaras Sibiu)
    (connected Bucharest Fagaras)
    (connected Giurgiu Bucharest)
    (connected Urziceni Bucharest)
    (connected Hirsova Urziceni)
    (connected Vaslui Urziceni)
    (connected Eforie Hirsova)
    (connected Iasi Vaslui)
    (connected Neamt Iasi)
    (connected Oradea Zerid)
    (connected Oradea Sibiu)
    (connected Zerid Arad)
    (connected Arad Sibiu)
    (connected Arad Timisoara)
    (connected Timisoara Lugoj)
    (connected Lugoj Mehadia)
    (connected Mehadia Dobreta)
    (connected Dobreta Craiova)
    (connected Craiova Pitesti)
    (connected Craiova Rimnicu)
    (connected Pitesti Bucharest)
    (connected Pitesti Rimnicu)
    (connected Rimnicu Sibiu)
    (connected Sibiu Fagaras)
    (connected Fagaras Bucharest)
    (connected Bucharest Giurgiu)
    (connected Bucharest Urziceni)
    (connected Urziceni Hirsova)
    (connected Urziceni Vaslui)
    (connected Hirsova Eforie)
    (connected Vaslui Iasi)
    (connected Iasi Neamt)
  )

  (:goal
    (and
      (at-package Bucharest Paq1) 
      (at-package Bucharest Paq2) 
      (at-package Timisoara Paq3) 
      (at-package Arad Paq4) 
      (at-package Bucharest Paq5) 
      (at-package Pitesti Paq6) 
      (at-package Sibiu Paq7) 
      (at-package Hirsova Paq8) 
      (at-package Eforie Paq9) 
      (at-package Hirsova Paq10)
      (at-package Eforie Paq11)  
      (at-package Neamt Paq12)  
    )
  )
)