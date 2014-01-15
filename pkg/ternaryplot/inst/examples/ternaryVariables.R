library( "ternaryplot" ) 


## Default variables
tv <- new( "ternaryVariables" ) 
tv 

## Custom variables
tv2 <- new( 
    "ternaryVariables", 
    blrNames  = c( "CLAY", "SILT", "SAND" ), 
    blrLabels = c( "Clay [%]", "SILT [%]", "SAND [%]" ) ) 
tv2 


## Methods defined for ternaryGeometry:
showMethods( class = "ternaryVariables" ) 
