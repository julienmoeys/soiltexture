\name{ternaryData}
\alias{ternaryData}
\alias{ternaryData.character}
\alias{ternaryData.ternarySystem}
\title{Converts tabular data to ternary data, and perform some data-checks}
\usage{
  ternaryData(s, ...)

  \method{ternaryData}{character} (s, ...)

  \method{ternaryData}{ternarySystem} (s, x,
    .blrNames = NULL, .fracSum = NULL, testRange, testSum,
    ...)
}
\arguments{
  \item{s}{A \code{ternarySystem} object, as created with
  \code{\link[ternaryplot]{ternarySystem}}, or a single
  \code{character} string. Can be missing.}

  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} containing point ternary data
  (x-y-x) to be tested.}

  \item{.blrNames}{Vector of 3 character strings. Column
  names of the variables in \code{x} that corresponds to
  the bottom, left and right variables in \code{s}
  (\code{blrNames(s)}). If \code{NULL}, Columns and
  variable names in \code{x} and \code{s} should match.}

  \item{testRange}{Single logical. Test if the range of
  fraction is between 0 and the expected sum of fractions
  (1 or 100).}

  \item{testSum}{Single logical. Test if the sum of the 3
  fractions is equal to the expected sum of fractions (1 or
  100).}

  \item{\dots}{Additional parameters passed to
  \code{ternarySystem}-methods.}
}
\value{
  Returns a \code{ternaryData}
  \code{\link[base]{data.frame}} object.
}
\description{
  Converts tabular data to ternary data, and perform some
  data-checks
}

