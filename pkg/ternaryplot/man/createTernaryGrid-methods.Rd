\name{createTernaryGrid}
\alias{createTernaryGrid}
\alias{createTernaryGrid.character}
\alias{createTernaryGrid.ternarySystem}
\title{Create a regular ternary grid. Base frame for binning ternary data.}
\usage{
  createTernaryGrid(s, ...)

  \method{createTernaryGrid}{character} (s, ...)

  \method{createTernaryGrid}{ternarySystem} (s, n = 10,
    ...)
}
\arguments{
  \item{s}{Either a single character string, or a
  \code{ternarySystem} object, as obtained from
  \code{\link[ternaryplot]{getTernarySystem}}}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\value{
  A ternary grid (of polygons), with class
  \code{ternaryPolygons}.
}
\description{
  Create a regular ternary grid. Base frame for binning
  ternary data.
}

