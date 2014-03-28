\name{ternaryCheck}
\alias{ternaryCheck}
\alias{ternaryCheck.ternaryGeometry}
\alias{ternaryCheck.ternarySystem}
\alias{ternaryCheck.ternaryVariables}
\title{Check the validity of ternary*-class objects}
\usage{
  ternaryCheck(x, ...)

  \method{ternaryCheck}{ternaryGeometry} (x,
    onFailure = stop, ...)

  \method{ternaryCheck}{ternaryVariables} (x,
    onFailure = stop, ...)

  \method{ternaryCheck}{ternarySystem} (x,
    onFailure = stop, ...)
}
\arguments{
  \item{x}{A ternary*-class object.}

  \item{onFailure}{A function like \code{\link[base]{stop}}
  or \code{\link[base]{warning}} or
  \code{\link[base]{message}} to be called if a
  non-conformity is found.}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\description{
  Check the validity of ternary*-class objects
}

