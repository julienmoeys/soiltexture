library( "ternaryplot" ) 


## Default variables
tsy <- new( "ternarySystem" ) 
tsy 

## Custom variables
tsy2 <- new( 
    "ternarySystem", 
    "ternaryVariables" = new( 
        "ternaryVariables", 
        # "blrNames"  = c( "CLAY", "SILT", "SAND" ), # won't work
        "blrLabels" = c( "Clay [%]", "Silt [%]", "Sand [%]" ) 
    ),  
    "ternaryGeometry" = new( 
        "ternaryGeometry", 
        "fracSum"   = 100, 
        "tlrAngles" = c( 45, 45, 90 ) # top, left, right angles
    ), 
    "main" = "My ternary plot" ) 



# Changing variable names must be done 'afterwards', because 
#   it also requires other internal changes in the ternarySystem
#   (like the definition of class vertices)
blrNames( tsy2 ) <- c( "CLAY", "SILT", "SAND" ) 
tsy2


## Methods defined for ternaryGeometry:
showMethods( class = "ternarySystem" ) 
