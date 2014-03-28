\name{blrLabels}
\alias{blrLabels}
\alias{blrLabels.ternarySystem}
\alias{blrLabels.ternaryVariables}
\alias{blrLabels<-}
\alias{blrLabels<-.ternarySystem}
\alias{blrLabels<-.ternaryVariables}
\title{Set or get the bottom-left-right axis labels of a ternarySystem
 object}
\usage{
  blrLabels(s, ...)

  \method{blrLabels}{ternarySystem} (s, ...)

  \method{blrLabels}{ternaryVariables} (s, ...)

  blrLabels(s, ..., value) <- value

  \method{blrLabels}{ternarySystem} (s, ..., value) <-
    value

  \method{blrLabels}{ternaryVariables} (s, ..., value) <-
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
  Set or get the bottom-left-right axis labels of a
  \code{ternarySystem} object.
}

