\docType{methods}
\name{ternaryLims}
\alias{ternaryLims}
\alias{ternaryLims,data.frame-method}
\alias{ternaryLims,matrix-method}
\title{NOT EXPORTED: Find optimal axis limits for a ternary plot.}
\usage{
  \S4method{ternaryLims}{data.frame}( x, s = "default",
    \dots )

  \S4method{ternaryLims}{matrix}( x, s = "default", \dots )
}
\arguments{
  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing point ternary data
  (x-y-x) to be ploted on the graph.  It should contain the
  3 columns names given in \code{s};}

  \item{s}{Either a character string naming the ternary
  classification system to be used (if pre-defined) or a
  \code{\linkS4class{ternarySystem}} x.}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\value{
  Returns a \code{\link[base]{data.frame}} with 3 columns
  (bottom, left and right variables) and 2 rows: the
  minimun value and the maximum value of each variable.
}
\description{
  NOT EXPORTED: Find optimal axis limits for a ternary
  plot.
}

