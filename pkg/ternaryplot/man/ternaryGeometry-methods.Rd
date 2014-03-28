\name{ternaryGeometry}
\alias{ternaryGeometry}
\alias{ternaryGeometry.ternarySystem}
\alias{ternaryGeometry<-.ternarySystem}
\title{Set or get the ternaryGeometry of a ternarySystem object}
\usage{
  ternaryGeometry(s, ...)

  \method{ternaryGeometry}{ternarySystem} (s, ...)

  \method{ternaryGeometry}{ternarySystem} (s, ..., value)
    <- value
}
\arguments{
  \item{s}{A \code{ternarySystem} object, as created with
  \code{\link[ternaryplot]{createTernarySystem}}.}

  \item{\dots}{Additional parameters passed to specific
  methods.}

  \item{value}{A \code{ternaryGeometry} object, as created
  with \code{\link[ternaryplot]{createTernaryGeometry}}.}
}
\description{
  Set or get the ternaryGeometry of a \code{ternarySystem}
  object.
}

