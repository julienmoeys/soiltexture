\name{ternaryGrid}
\alias{ternaryGrid}
\alias{ternaryGrid.ternarySystem}
\title{Add Grid to a ternary plot}
\usage{
  ternaryGrid(s, ...)

  \method{ternaryGrid}{ternarySystem} (s, .plot = TRUE,
    ...)
}
\arguments{
  \item{s}{A \code{\link[ternaryplot]{ternarySystem}}
  object.}

  \item{.plot}{Single logical value. Set to \code{FALSE} if
  you don't want to plot the graphical element and simply
  returns them as x-y coordinates (or \code{Spatial*}
  objects if \code{sp} is set to \code{TRUE} in
  \code{\link{tpPar}}).}

  \item{\dots}{Additional parameters passed to
  \code{\link[ternaryplot]{ternarySegments}}, except
  \code{col} (see details)}
}
\value{
  Invisibly returns a list of \code{data.frame} with the
  start and end points of the grid segments for each of the
  3 axis.
}
\description{
  Add Grid to a ternary plot
}
\details{
  Grid-line colors can be changed via
  \code{\link[ternaryplot]{tpPar}("grid.line.col")}.
}

