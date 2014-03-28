\name{ternaryVariables}
\alias{ternaryVariables}
\alias{ternaryVariables.ternarySystem}
\alias{ternaryVariables<-}
\alias{ternaryVariables<-.ternarySystem}
\title{Set or get the ternaryVariables of a ternarySystem object.}
\usage{
  ternaryVariables(s, ...)

  \method{ternaryVariables}{ternarySystem} (s, ...)

  ternaryVariables(s, ..., value) <- value

  \method{ternaryVariables}{ternarySystem} (s, ..., value)
    <- value
}
\arguments{
  \item{s}{A \code{ternarySystem} object, as created with
  \code{\link[ternaryplot]{createTernarySystem}}.}

  \item{\dots}{Additional parameters passed to specific
  methods.}

  \item{value}{A \code{ternaryVariables} object, as created
  with \code{\link[ternaryplot]{createTernaryVariables}}.}
}
\description{
  Set or get the ternaryVariables of a \code{ternarySystem}
  object.
}

