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
tsy2 <- new( 
    "ternarySystem", 
    "ternaryVariables" = new( 
        "ternaryVariables", 
        # "blrNames"  = c( "CLAY", "SILT", "SAND" ), # won't work
        "blrLabels" = c( "Clay [\%]", "Silt [\%]", "Sand [\%]" ) 
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
}

