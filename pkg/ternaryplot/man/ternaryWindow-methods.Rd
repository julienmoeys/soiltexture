\docType{methods}
\name{ternaryWindow}
\alias{ternaryWindow}
\alias{ternaryWindow,character-method}
\alias{ternaryWindow,missing-method}
\alias{ternaryWindow,ternarySystem-method}
\title{NOT EXPORTED Draw an invisible base-plot for ternaryPlot}
\usage{
  ternaryWindow(s, x, scale = FALSE, ...)
}
\arguments{
  \item{s}{A \code{\linkS4class{ternarySystem}} object, or
  a single \code{character} string. Can be missing.}

  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing point ternary data
  (x-y-x) to be ploted on the graph.  It should contain the
  3 columns names given in \code{s}. Can be missing or
  \code{NULL}.}

  \item{scale}{A \code{\link[base]{data.frame}} with 3
  columns and 2 rows.  Contains the min and max limits of
  each of the 3 variables (columns = variables, rows = min
  and max).}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\description{
  NOT EXPORTED Draw an invisible base-plot for ternaryPlot
}

