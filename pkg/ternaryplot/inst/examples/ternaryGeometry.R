library( "ternaryplot" ) 


## Default geometry
tg <- new( "ternaryGeometry" )
tg

## Custom geometry
tg <- new( 
    "ternaryGeometry", 
    "fracSum"   = 1, 
    "blrClock"  = rep( FALSE, 3 ), 
    "tlrAngles" = c( 45, 45, 90 ) ) 
tg 


## Methods defined for ternaryGeometry:
showMethods( class = "ternaryGeometry" )  
