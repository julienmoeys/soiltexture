\name{ternaryVariables-class}
\alias{ternaryVariables-class}
\title{Class for defining the variables of a ternary plot}
\description{
  Class for defining the variables of a ternary plot. In
  this package, ternary plots variables are defined by the
  3 variables name (bottom, left, right), as they will be
  found in \code{data.frame} containing ternary datasets,
  and by the label of these variables on the axis of a
  ternary plot.
}
\section{Slots}{
  \describe{ \item{\code{blrNames}:}{ Vector of characters.
  Bottom, left and right variable names as they will be
  found in \code{data.frame} containing ternary data.  }
  \item{\code{blrLabels}:}{ Vector of characters or vector
  of expressions. Bottom, left and right variable labels as
  they will be displayed on ternary plots.  } }
}
\examples{
library( "ternaryplot" ) 


## Default variables
tv <- new( "ternaryVariables" ) 
tv 

## Custom variables
tv2 <- new( 
    "ternaryVariables", 
    blrNames  = c( "CLAY", "SILT", "SAND" ), 
    blrLabels = c( "Clay [\%]", "SILT [\%]", "SAND [\%]" ) ) 
tv2 


## Methods defined for ternaryGeometry:
showMethods( class = "ternaryVariables" ) 
}

