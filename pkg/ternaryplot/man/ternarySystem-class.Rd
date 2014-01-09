\name{ternarySystem-class}
\alias{ternarySystem-class}
\title{Class for defining a ternary classification}
\description{
  Class for defining a ternary classification. ternary
  classification are polygons drawn on top of ternary
  plots, that define different zones in the fractions
}
\section{Slots}{
  \describe{ \item{\code{ternaryGeometry}:}{ An object of
  class \code{ternaryGeometry}. See
  \code{\link{ternaryGeometry-class}}; }
  \item{\code{ternaryVariables}:}{ An object of class
  \code{ternaryVariables}. See
  \code{\link{ternaryVariables-class}}; }
  \item{\code{main}:}{ Single character string, or single
  \code{\link[base]{expression}}. Title of the ternary
  plot; } }
}
\examples{
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
        "blrLabels" = c( "B [\%]", "L [\%]", "R [\%]" )
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
}

