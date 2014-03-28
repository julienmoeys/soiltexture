\name{blrNames}
\alias{blrNames}
\alias{blrNames.ternarySystem}
\alias{blrNames.ternaryVariables}
\alias{blrNames<-}
\alias{blrNames<-.ternarySystem}
\alias{blrNames<-.ternaryVariables}
\title{Set or get the bottom-left-right axis names of a ternarySystem
 object}
\usage{
  blrNames(s, ...)

  \method{blrNames}{ternarySystem} (s, ...)

  \method{blrNames}{ternaryVariables} (s, ...)

  blrNames(s, ..., value) <- value

  \method{blrNames}{ternarySystem} (s, ..., value) <- value

  \method{blrNames}{ternaryVariables} (s, ..., value) <-
    value
}
\arguments{
  \item{s}{A \code{ternarySystem} object, as created with
  \code{\link[ternaryplot]{createTernarySystem}}, or a
  \code{ternaryVariables} object, as created with
  \code{\link[ternaryplot]{createTernaryVariables}}.}

  \item{\dots}{Additional parameters passed to
  \code{\link[ternaryplot]{ternaryCheck}}.}

  \item{value}{A vector of 3 character strings. Names of
  the bottom-left-right axis.}
}
\description{
  Set or get the bottom-left-right axis names of a
  \code{ternarySystem} object.
}

