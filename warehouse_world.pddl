(define (domain warehouse)
	(:requirements :typing)
	(:types robot pallette - bigobject
        	location shipment order saleitem)

  	(:predicates
    	(ships ?s - shipment ?o - order)
    	(orders ?o - order ?si - saleitem)
    	(unstarted ?s - shipment)
    	(started ?s - shipment)
    	(complete ?s - shipment)
    	(includes ?s - shipment ?si - saleitem)

    	(free ?r - robot)
    	(has ?r - robot ?p - pallette)

    	(packing-location ?l - location)
    	(packing-at ?s - shipment ?l - location)
    	(available ?l - location)
    	(connected ?l - location ?l - location)
    	(at ?bo - bigobject ?l - location)
    	(no-robot ?l - location)
    	(no-pallette ?l - location)

    	(contains ?p - pallette ?si - saleitem)
  )
  
  

   (:action startShipment
      :parameters (?s - shipment ?o - order ?l - location)
      :precondition (and (unstarted ?s) (not (complete ?s)) (ships ?s ?o) (available ?l) (packing-location ?l))
      :effect (and (started ?s) (packing-at ?s ?l) (not (unstarted ?s)) (not (available ?l)))
   )
   
   
   
   
   
   
   
   (:action robotMove
      :parameters (?robot - robot ?l1 - location ?l2 - location)
      :precondition (and (at ?robot ?l1) (free ?robot) (no-robot ?l2) (connected ?l1 ?l2))
      :effect (and (no-robot ?l1) (at ?robot ?l2) (not (no-robot ?l2)) (not (at ?robot ?l1)))
      
      )
   
  
  
  
   (:action robotMoveWithPallette
      :parameters (?robot - robot ?p - pallette ?l1 - location ?l2 - location)
      :precondition (and (at ?robot ?l1) (free ?robot)(at ?p ?l1)  (no-robot ?l2) (no-pallette ?l2) (connected ?l1 ?l2))
      :effect (and (has ?robot ?p) (at ?robot ?l2) (at ?p ?l2) 
                   (no-robot ?l1) (no-pallette ?l1) 
                   (not (at ?robot ?l1)) (not (at ?p ?l1))
                   (not (no-robot ?l2))(not (no-pallette ?l2)))
      
      )
      
      
      
    
   (:action moveItemFromPalletteToShipment
      :parameters (?l - location ?s - shipment ?si - saleitem ?p - pallette ?o - order)
      :precondition (and (packing-location ?l) (at ?p ?l) (contains ?p ?si)  (packing-at ?s ?l)
                    (ships ?s ?o) (orders ?o ?si) (not (includes ?s ?si)))
      :effect (and (includes ?s ?si) (not (contains ?p ?si)))

   
   )
   
   
   (:action completeShipment
     :parameters (?s - shipment ?o - order ?l - location)
     :precondition (and (ships ?s ?o)(started ?s) (not (complete ?s)) (packing-at ?s ?l))
     :effect (and (complete ?s) (available ?l) (not (packing-at ?s ?l)) )
    )



)
