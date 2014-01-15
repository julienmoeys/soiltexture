\name{tpPar}
\alias{tpPar}
\title{Get or set default parameters for the package.}
\usage{
  tpPar(par = NULL, reset = FALSE, testRange, testSum,
    fracSumTol, ticksAt, ticksShift, arrowsShift)
}
\arguments{
  \item{par}{Three possible cases: \itemize{ \item If
  \code{par} is \code{NULL} (default): All the actual value
  of the parameters will be silently returned.  \item If
  \code{par} is a vector of character strings representing
  parameter names. The value of the parameters named here
  will be (silently) returned.  \item If \code{par} is a
  list following the format \code{tag = value}, where
  \code{tag} is the name of the parameter to be changed,
  and \code{value} is its new value.  Such a list is
  returned by \code{tpPar()}. Notice that parameters can
  also be set indivudually, using the options listed below.
  }}

  \item{reset}{Single logical. If TRUE, all the parameters
  will be set to their default value. Values are reset
  before any change to the parameter values, as listed
  below.}

  \item{testRange}{Single logical. Test if the range of
  fraction is between 0 and the expected sum of fractions
  (1 or 100).}

  \item{testSum}{Single logical. Test if the sum of the 3
  fractions is equal to the expected sum of fractions (1 or
  100).}

  \item{fracSumTol}{Single numeric. Tolerance on the sum of
  the 3 ternary fractions. Overall tolerance is
  \code{fracSum * fracSumTol}, where \code{fracSum} is the
  expected sum of the 3 ternary fractions, as given by a
  \code{\linkS4class{ternaryGeometry}} or a
  \code{\linkS4class{ternarySystem}}.}

  \item{ticksAt}{Vector of numeric. Pre-defined position of
  the tick-marks for the 3 axis.  Between 0 and 'fracSum'
  (the sum of the 3 fractions).}

  \item{ticksShift}{Single numeric. Tick-marks 'size',
  expressed so that \code{ticksShift * fracSum} is the
  length of the tick-marks.}

  \item{arrowsShift}{Vector of tow numeric values. Axis'
  arrows' shift from their axis, expressed so that
  \code{arrowsShift * fracSum} is the start and end point.}
}
\value{
  Returns a partial or complete list of (actual) parameter
  values, as a named list.
}
\description{
  Get or set default parameters for the package. Notice
  changes done to the parameter values are reset everytime
  the R session is closed and the package is reloaded.
}
\details{
  The function has 3 possible, non-exclusive behaviours:
  \itemize{ \item If \code{reset=TRUE}, resetting the
  parameters to their initial values, as defined in this
  function. \item (Silently) returning the actual value of
  the package parameters. If \code{par=NULL}, all the
  values are returned.  If \code{par} is a vector of
  parameter names, their value will be returned.  \item
  Setting-up the value of some parameters, passing a list
  of parameter value to \code{par} OR setting some of the
  parameters listed above. }

  Notice that when \code{reset=TRUE} and some new parameter
  values are provided, the parameters are first reset, and
  then the new parameter values are set. If \code{par} is a
  list, parameters are set first according to values in
  \code{par}, and then according to values in the
  parameters listed below. This combination is not
  recommended, but nonetheless possible.

  The actual value of the parameters is stored in (and can
  be retrieved from) the environment \code{rspPars}. The
  default value of the parameters are stored in the
  environment \code{rspPars}. Do not use them directly.
}
\seealso{
  \code{\link{getTpPar}}.
}

