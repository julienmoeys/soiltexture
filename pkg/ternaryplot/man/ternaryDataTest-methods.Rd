\docType{methods}
\name{ternaryDataTest}
\alias{ternaryDataTest}
\alias{ternaryDataTest,character-method}
\alias{ternaryDataTest,missing-method}
\alias{ternaryDataTest,ternarySystem-method}
\title{Test the conformity of ternary point data}
\usage{
  \S4method{ternaryDataTest}{missing}( s, \dots )

  \S4method{ternaryDataTest}{character}( s, \dots )

  \S4method{ternaryDataTest}{ternarySystem}( s, x,
    testRange = TRUE, testSum = TRUE, \dots )
}
\arguments{
  \item{s}{A \code{\linkS4class{ternarySystem}} object or a
  character string naming a pre-defined
  \code{ternarySystem}.}

  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing point ternary data
  (x-y-x) to be tested.}

  \item{testRange}{Single logical. Test if the range of
  fraction is between 0 and the expected sum of fractions
  (1 or 100).}

  \item{testSum}{Single logical. Test if the sum of the 3
  fractions is equal to the expected sum of fractions (1 or
  100).}

  \item{\dots}{Additional parameters passed to
  \code{ternarySystem-methods}.}
}
\value{
  Does not return anything. Stops if an error is found.
}
\description{
  Test the conformity of ternary point data according to a
  \code{\linkS4class{ternarySystem}} object.
}

