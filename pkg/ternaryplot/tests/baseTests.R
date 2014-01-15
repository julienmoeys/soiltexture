    # setwd( "/home/moeysj/Desktop/ternaryplot/pkg/ternaryplot/R" ) 
    
    # source( "aaa-ternaryplot-classes.R" ) 
    # source( "ternaryplot-options.R" ) 
    # source( "ternaryplot.R" ) 
    # source( "ternarySystems.R" ) 

library( "ternaryplot" )


# Run some tests
s <- ternaryWindow() # Opens a plot window

# or

s <- ternaryWindow( "default" ) 

# or

s <- ternarySystemGet() 
# s@'ternaryGeometry'@'tlrAngles' <- c(45,90,45) 

s <- ternaryWindow( s = s ) 
# .ternaryGridBase( s = s )

.ternaryTicks( s = s ) 
ternaryGrid( s = s ) 
ternaryBox( s = s ) 

blrClock( s ) <- rep( F, 3 ) 

# s@'ternaryGeometry'@'tlrAngles' <- c(45,90,45)

s <- ternaryWindow( s = s ) 
# .ternaryGridBase( s = s )
.ternaryTicks( s = s ) 
ternaryGrid( s = s ) 
ternaryBox( s = s ) 

blrClock( s )  <- c( F, T, NA ) 
tlrAngles( s ) <- c(45,90,45) 

s <- ternaryWindow( s = s ) 
.ternaryTicks( s = s ) 
ternaryGrid( s = s ) 
ternaryBox( s = s ) 


blrClock( s ) <- c( T, NA, F ) 
tlrAngles( s ) <- c(45,45,90)
s <- ternaryWindow( s = s ) 
.ternaryTicks( s = s ) 
ternaryGrid( s = s ) 
ternaryBox( s = s ) 



