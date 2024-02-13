
library( "ternaryplot" ) 


## Default variables
tv <- createTernaryVariables() 
tv 

## Custom variables
tv2 <- createTernaryVariables( 
    blrNames  = c( "CLAY", "SILT", "SAND" ), 
    blrLabels = c( "Clay [%]", "SILT [%]", "SAND [%]" ) ) 
tv2 

