% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/ternaryplot.R
\name{ternaryPoints}
\alias{ternaryPoints}
\alias{ternaryPoints.ternarySystem}
\title{Add points to a ternary plot}
\usage{
ternaryPoints(s, ...)

\method{ternaryPoints}{ternarySystem}(s, x, .plot = TRUE, ...)
}
\arguments{
\item{s}{A \code{\link[ternaryplot]{ternarySystem}} object.}

\item{x}{A \code{\link[base]{data.frame}} or a
 \code{\link[base]{matrix}} containing ternary data-points.}

\item{.plot}{Single logical value. Set to \code{FALSE} if you don't want
 to plot the graphical element and simply returns them as
 x-y coordinates (or \code{Spatial*} objects if \code{sp} is
 set to \code{TRUE} in \code{\link{tpPar}}).}

\item{\dots}{Additional parameters passed to \code{\link[graphics]{points}}.}
}
\value{
Invisibly returns the graphical element as x-y coordinates or
 a \code{Spatial*} objects (see \code{.plot}).
}
\description{
Add points to a ternary plot
}
\seealso{
\code{\link[graphics]{points}}.
}

