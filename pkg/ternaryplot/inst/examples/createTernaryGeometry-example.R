
library( "ternaryplot" ) 


## Default geometry
tg <- createTernaryGeometry()
tg

## Custom geometry
tg <- createTernaryGeometry( 
    "fracSum"   = 1, 
    "blrClock"  = rep( FALSE, 3 ), 
    "tlrAngles" = c( 45, 45, 90 ) ) 
tg 

