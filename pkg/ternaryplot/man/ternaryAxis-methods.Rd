% Generated by roxygen2 (4.1.1): do not edit by hand
% Please edit documentation in R/ternaryplot.R
\name{ternaryAxis}
\alias{ternaryAxis}
\alias{ternaryAxis.character}
\alias{ternaryAxis.ternarySystem}
\title{Add axis to a ternary plot (axis lines, ticks, labels, titles and arrows)}
\usage{
ternaryAxis(s, ...)

\method{ternaryAxis}{character}(s, ...)

\method{ternaryAxis}{ternarySystem}(s, side = 1:3, tick = TRUE,
  arrow = TRUE, ...)
}
\arguments{
\item{s}{A \code{ternarySystem} object, as created with
 \code{\link[ternaryplot]{createTernarySystem}}, or a single
 \code{character} string. Can be missing.}

\item{side}{A vector of integer specifying which side of the plot the axis is to
 be drawn on.  The axis is placed as follows: 1=below, 2=left, 3=right (note
 that this differ from \code{\link[graphics]{axis}} where 3=above and
 4=right). Default is to draw axis on the 3 sides.}

\item{tick}{A logical value specifying whether tickmarks and an axis line
 should be drawn.}

\item{arrow}{A logical value specifying whether axis' arrows should be drawn.}

\item{\dots}{Additional parameters passed to specific methods.}
}
\description{
Add axis to a ternary plot (axis lines, ticks, labels, titles and arrows)
}

