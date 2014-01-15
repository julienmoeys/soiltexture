\docType{methods}
\name{ternaryText}
\alias{ternaryText}
\alias{ternaryText,data.frame-method}
\alias{ternaryText,matrix-method}
\title{Draw text strings (labels) on a triangle plot}
\usage{
  ternaryText(x, labels, s, ...)
}
\arguments{
  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing ternary
  data-points, coordinates of the text strings to be added
  on the plot.}

  \item{s}{A \code{\linkS4class{ternarySystem}} object, or
  a character string naming a pre-defined
  \code{ternarySystem}.  If missing, set to
  \code{default}.}

  \item{labels}{A vector of character strings, or
  expressions to be added on the triangle plot. See
  \code{\link[graphics]{text}}.}

  \item{\dots}{Additional parameters passed to
  \code{\link[graphics]{text}}.}
}
\description{
  Draw text strings (labels) on a triangle plot
}
\seealso{
  \code{\link[graphics]{points}}.
}

