
library( "ternaryplot" ) 


## Default variables
tsy <- createTernarySystem() 
tsy 

## Custom variables
tsy2 <- createTernarySystem( 
    "ternaryVariables" = createTernaryVariables( 
        "blrNames"  = c( "CLAY", "SILT", "SAND" ), 
        "blrLabels" = c( "Clay [%]", "Silt [%]", "Sand [%]" ) 
    ),  
    "ternaryGeometry" = createTernaryGeometry( ##
        "fracSum"   = 100, 
        "tlrAngles" = c( 45, 45, 90 ) # top, left, right angles
    ), 
    "main" = "My ternary plot" ) 

tsy2

