\docType{methods}
\name{ternaryArrows}
\alias{ternaryArrows}
\alias{ternaryArrows,data.frame-method}
\title{Draw a sequence of ternary arrows on a triangle plot}
\usage{
  ternaryArrows(from, to, s, ...)
}
\arguments{
  \item{from}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing the ternary
  coordinates of points *from* which to draw.}

  \item{to}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing the ternary
  coordinates of points *to* which to draw.}

  \item{s}{A \code{\linkS4class{ternarySystem}} object, or
  a character string naming a pre-defined
  \code{ternarySystem}.  If missing, set to
  \code{default}.}

  \item{\dots}{Additional parameters passed to
  \code{\link[graphics]{arrows}}.}
}
\description{
  Draw a sequence of ternary arrows on a triangle plot
}
\seealso{
  \code{\link[graphics]{arrows}}.
}

