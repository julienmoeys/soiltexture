\name{blrClock}
\alias{blrClock}
\alias{blrClock.ternaryGeometry}
\alias{blrClock.ternarySystem}
\alias{blrClock<-}
\alias{blrClock<-.ternaryGeometry}
\alias{blrClock<-.ternarySystem}
\title{Set or get the bottom-left-right orientation of a ternarySystem
 object}
\usage{
  blrClock(s, ...)

  \method{blrClock}{ternarySystem} (s, ...)

  \method{blrClock}{ternaryGeometry} (s, ...)

  blrClock(s, ..., value) <- value

  \method{blrClock}{ternarySystem} (s, ..., value) <- value

  \method{blrClock}{ternaryGeometry} (s, ..., value) <-
    value
}
\arguments{
  \item{s}{A \code{ternarySystem} object, as created with
  \code{\link[ternaryplot]{createTernarySystem}}, or a
  \code{ternaryGeometry} object, as created with
  \code{\link[ternaryplot]{createTernaryGeometry}}.}

  \item{\dots}{Additional parameters passed to
  \code{\link[ternaryplot]{ternaryCheck}}.}

  \item{value}{A vector of 3 logical values.
  Bottom-left-right orientation of a ternarySystem object.}
}
\description{
  Set or get the bottom-left-right orientation of a
  \code{ternarySystem} object.
}

