library( "ternaryplot" ) 


## Default variables
tsy <- new( "ternarySystem" ) 
tsy 

## Custom variables
tsy <- new( 
    "ternarySystem", 
    "ternaryVariables" = new( 
        "ternaryVariables", 
        ## Do not change 'blrNames' as it requires to set vertices 
        ## as well!
        #"blrNames"  = c( "B", "L", "R" ), 
        "blrLabels" = c( "B [%]", "L [%]", "R [%]" )
    ),  
    "ternaryGeometry" = new( 
        "ternaryGeometry", 
        "fracSum"   = 100, 
        "tlrAngles" = c( 45, 45, 90 ) 
    ), 
    "main" = "My ternary plot" 
) 
tsy 



## Changing variable names is a bit more complicated:
blrNames( tsy ) <- c( "B", "L", "R" ) 



## Methods defined for ternaryGeometry:
showMethods( class = "ternarySystem" ) 
