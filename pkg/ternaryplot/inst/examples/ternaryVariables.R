library( "ternaryplot" ) 


## Default variables
tv <- new( "ternaryVariables" ) 
tv 

## Custom variables
tv <- new( 
    "ternaryVariables", 
    blrNames  = c( "CLAY", "SILT", "SAND" ), 
    blrLabels = c( "Clay [%]", "SILT [%]", "SAND [%]" ) ) 
tv 


## Methods defined for ternaryGeometry:
showMethods( class = "ternaryVariables" ) 
