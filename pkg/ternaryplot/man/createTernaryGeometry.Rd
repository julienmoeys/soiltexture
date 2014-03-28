\name{createTernaryGeometry}
\alias{createTernaryGeometry}
\alias{ternaryGeometry}
\title{Creates a ternaryGeometry object: ternary plot geometry definition.}
\usage{
  createTernaryGeometry(tlrAngles = c(60, 60, 60),
    blrClock = rep(TRUE, 3), fracSum = 100, ...)
}
\arguments{
  \item{tlrAngles}{Vector of numeric. Top, left and right
  angle (in degrees) of the ternary diagram. Must sum to
  180 degrees.}

  \item{blrClock}{Vector of logical. Bottom, left and right
  axis directions.  Set to \code{TRUE} if the axis is
  clockwise, and to \code{FALSE} if the axis is
  counter-clockwise.}

  \item{fracSum}{Single numeric. Sum of the three
  fractions. Must be 1 (if a fraction) or 100 (if a
  percentage).}

  \item{\dots}{Additional parameters passed to
  \code{\link[ternaryplot]{ternaryCheck}}}
}
\description{
  Creates a ternaryGeometry object: ternary plot geometry
  definition.
}
\details{
  In this package, ternary plots geometries are defined by
  the 3 triangle's angles (top, left, right), and by the
  sum of the 3 fractions it represents (1 if a fraction,
  and 100 if a percentage).
}
\examples{
library( "ternaryplot" ) 


## Default geometry
tg <- createTernaryGeometry()
tg

## Custom geometry
tg <- createTernaryGeometry( 
    "fracSum"   = 1, 
    "blrClock"  = rep( FALSE, 3 ), 
    "tlrAngles" = c( 45, 45, 90 ) ) 
tg 

}

