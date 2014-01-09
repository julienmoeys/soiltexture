\docType{methods}
\name{ternaryPoints}
\alias{ternaryPoints}
\alias{ternaryPoints,data.frame-method}
\alias{ternaryPoints,matrix-method}
\title{Draw a sequence of ternary data-points on a triangle plot}
\usage{
  ternaryPoints(x, s, ...)
}
\arguments{
  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing ternary
  data-points.}

  \item{s}{A \code{\linkS4class{ternarySystem}} object, or
  a character string naming a pre-defined
  \code{ternarySystem}.  If missing, set to
  \code{default}.}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\description{
  Draw a sequence of ternary data-points on a triangle plot
}
\seealso{
  \code{\link[graphics]{points}}.
}

