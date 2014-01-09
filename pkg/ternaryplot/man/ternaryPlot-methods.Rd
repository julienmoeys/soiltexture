\docType{methods}
\name{ternaryPlot}
\alias{ternaryPlot}
\alias{ternaryPlot,data.frame-method}
\alias{ternaryPlot,matrix-method}
\alias{ternaryPlot,missing-method}
\title{Generic function for drawing a ternary plot}
\usage{
  \S4method{ternaryPlot}{data.frame}( x, s = "default",
    scale = FALSE, \dots )

  \S4method{ternaryPlot}{matrix}( x, s = "default", scale =
    FALSE, \dots )

  \S4method{ternaryPlot}{missing}( x, s = "default", scale
    = FALSE, \dots )
}
\arguments{
  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing point ternary data
  (x-y-x) to be ploted on the graph.  It should contain the
  3 columns names given in \code{s}. If missing, only the
  ternary classification is drawn.}

  \item{s}{Either a character string naming the ternary
  classification system to be used (if pre-defined) or a
  \code{\linkS4class{ternarySystem}} object.}

  \item{scale}{Either a logical value or a
  \code{\link[base]{data.frame}} with 3 columns and 2 rows.
  If \code{TRUE}, the triangle plot will be scaled to fit
  the data. If \code{FALSE}, no scaling is performed, and
  the full extent triangle plot is drawn. If a
  \code{data.frame}, contains the min and max limits of
  each of the 3 variables (columns = variables, rows = min
  and max).}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\description{
  Generic function for drawing a ternary plot
}

