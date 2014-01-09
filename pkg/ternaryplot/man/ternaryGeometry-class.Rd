\name{ternaryGeometry-class}
\alias{ternaryGeometry-class}
\title{Class for defining the geometry of a ternary plot}
\description{
  Class for defining the geometry of a ternary plot. In
  this package, ternary plots geometries are defined by the
  3 triangle's angles (top, left, right), and by the sum of
  the 3 fractions it represents (1 if a fraction, and 100
  if a percentage).
}
\section{Slots}{
  \describe{ \item{\code{tlrAngles}:}{ Vector of numeric.
  Top, left and right angle (in degrees) of the ternary
  diagram. Must sum to 180 degrees.  }
  \item{\code{blrClock}:}{ Vector of logical. Bottom, left
  and right axis directions.  Set to \code{TRUE} if the
  axis is clockwise, and to \code{FALSE} if the axis is
  counter-clockwise.  } \item{\code{fracSum}:}{ Single
  numeric. Sum of the three fractions. Must be 1 (if a
  fraction) or 100 (if a percentage).  } }
}
\examples{
library( "ternaryplot" ) 


## Default geometry
tg <- new( "ternaryGeometry" )
tg

## Custom geometry
tg <- new( 
    "ternaryGeometry", 
    "fracSum"   = 1, 
    "blrClock"  = rep( FALSE, 3 ), 
    "tlrAngles" = c( 45, 45, 90 ) ) 
tg 


## Methods defined for ternaryGeometry:
showMethods( class = "ternaryGeometry" )  
}

