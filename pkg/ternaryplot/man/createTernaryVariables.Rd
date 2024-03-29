% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/aa02-ternaryplot-classes.R
\name{createTernaryVariables}
\alias{createTernaryVariables}
\title{Creates a ternaryVariables object: ternary plot variables definitions.}
\usage{
createTernaryVariables(blrNames = paste0("F", 1:3),
  blrLabels = sprintf("Fraction \%s [\%s]", 1:3, "\%"), ...)
}
\arguments{
\item{blrNames}{Vector of characters. Bottom, left and right variable names
 as they will be found in \code{data.frame} containing ternary
 data.}

\item{blrLabels}{Vector of characters or vector of expressions. Bottom, left
 and right variable labels as they will be displayed on ternary
 plots.}

\item{\dots}{Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}}
}
\description{
Creates a ternaryVariables object: ternary plot variables definitions.
}
\details{
In this package, ternary plots variables are defined by the 3
 variables name (bottom, left, right), as they will be found in
 \code{\link[base]{data.frame}} containing ternary datasets,
 and by the label of these variables on the axis of a ternary
 plot.
}
\examples{

library( "ternaryplot" ) 


## Default variables
tv <- createTernaryVariables() 
tv 

## Custom variables
tv2 <- createTernaryVariables( 
    blrNames  = c( "CLAY", "SILT", "SAND" ), 
    blrLabels = c( "Clay [\%]", "SILT [\%]", "SAND [\%]" ) ) 
tv2 

}

