
    if( Sys.info()[["sysname"]] == "Linux" ){
        setwd( "/home/jules/Dropbox/_WORK/_PROJECTS/r_packages/ternaryplot" ) 
    }else{
        setwd( "C:/Users/julienm/Dropbox/_WORK/_PROJECTS/r_packages/ternaryplot" ) 
    }   
    
    source( "R/aa00-ternaryplot-package.R" ) 
    source( "R/aa01-ternaryplot-options.R" ) 
    source( "R/aa02-ternaryplot-classes.R" ) 
    source( "R/aa03-ternaryplot-classes-utility.R" ) 
    source( "R/aa04-ternarysystems.R" ) 
    source( "R/aa05-ternarydata.R" ) 
    source( "R/aa06-ternary2xy.R" ) 
    source( "R/aa07-plotUtilities.R" ) 
    source( "R/ternarygrid.R" ) 
    source( "R/ternaryplot.R" ) 

# library( "ternaryplot" )
library( "sp" )

p <- list(
    list(
        "blrClock"  = rep( T, 3 ), 
        "tlrAngles" = rep( 60, 3 )  
    ),  
    list(
        "blrClock"  = rep( F, 3 ), 
        "tlrAngles" = rep( 60, 3 )  
    ),  
    list(
        "blrClock"  = c( F, T, NA ), 
        "tlrAngles" = c(45,90,45)  
    ),  
    list(
        "blrClock"  = c( T, NA, F ), 
        "tlrAngles" = c(45,45,90)  
    )   
)   

par( mfrow = c(2,2) )


for( i in 1:length( p ) ){
    s <- getTernarySystem() 
    
    blrClock( s )  <- p[[ i ]][[ "blrClock" ]]
    
    tlrAngles( s ) <- p[[ i ]][[ "tlrAngles" ]]
    
    ternaryPlot( s = s )
}   
#   Problem: find "## axis orientation is NA" in ternaryplot.R

par( mfrow = c(1,2), xaxs = "i", yaxs = "i" )
plot( x = 1, y = 1, asp = TRUE )
ternaryPlot( s = getTernarySystem()  )
box( col = "red", lty = 2 )



# Run some tests
s <- ternaryWindow() # Opens a plot window

# or

s <- ternaryWindow( "default" ) 

# or

s <- getTernarySystem() 
# tlrAngles(s) <- c(45,90,45) 

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
