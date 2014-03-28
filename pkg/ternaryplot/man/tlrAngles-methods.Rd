\name{tlrAngles}
\alias{ternaryGeometry<-}
\alias{tlrAngles}
\alias{tlrAngles.ternaryGeometry}
\alias{tlrAngles.ternarySystem}
\alias{tlrAngles<-}
\alias{tlrAngles<-.ternaryGeometry}
\alias{tlrAngles<-.ternarySystem}
\title{Set or get the top, left and right angles of a ternary system
 object}
\usage{
  tlrAngles(s, ...)

  \method{tlrAngles}{ternarySystem} (s, ...)

  \method{tlrAngles}{ternaryGeometry} (s, ...)

  tlrAngles(s, ..., value) <- value

  \method{tlrAngles}{ternarySystem} (s, ..., value) <-
    value

  \method{tlrAngles}{ternaryGeometry} (s, ..., value) <-
    value

  ternaryGeometry(s, ..., value) <- value
}
\arguments{
  \item{s}{A \code{ternarySystem} object, as created with
  \code{\link[ternaryplot]{createTernarySystem}}, or a
  \code{ternaryGeometry} object, as created with
  \code{\link[ternaryplot]{createTernaryGeometry}}.}

  \item{\dots}{Additional parameters passed to specific
  methods.}

  \item{value}{Vector of three numerical values, summing to
  180. Top, left and right angles of the ternary system
  object.}
}
\description{
  Set or get the top, left and right angles of a
  \code{ternarySystem} object.
}

