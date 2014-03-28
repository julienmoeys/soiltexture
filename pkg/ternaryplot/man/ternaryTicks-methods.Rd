\name{.ternaryTicks}
\alias{.ternaryTicks}
\alias{.ternaryTicks.ternarySystem}
\title{INTERNAL: Draw axis' tick marks on a triangle plot}
\usage{
  .ternaryTicks(s, ...)

  \method{.ternaryTicks}{ternarySystem} (s, .plot = TRUE,
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
  start and end points of the grid segments
}
\description{
  INTERNAL: Draw axis' tick marks on a triangle plot
}
\details{
  Ticks colors can be changed via
  \code{\link[graphics]{par}("fg")}
}
\keyword{internal}

