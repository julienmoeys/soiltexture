\docType{methods}
\name{blr2xy}
\alias{blr2xy}
\alias{blr2xy,data.frame-method}
\alias{blr2xy,matrix-method}
\title{Converts ternary point-data into x-y coordinates}
\usage{
  \S4method{blr2xy}{data.frame}( x, s = "default", \dots )

  \S4method{blr2xy}{matrix}( x, s = "default", \dots )
}
\arguments{
  \item{x}{A \code{\link[base]{data.frame}} or a
  \code{\link[base]{matrix}} with ternary point-data.}

  \item{s}{A \code{\linkS4class{ternarySystem}} object or a
  character string naming an pre-defined
  \code{ternarySystem}.}

  \item{\dots}{Additional parameters passed to specific
  methods.}
}
\value{
  Returns a \code{\link[base]{data.frame}} with point-data
  in (columns) x and y.
}
\description{
  Converts ternary point-data (bottom, left, right axis)
  into x-y coordinates, according to the specification of a
  \code{\linkS4class{ternarySystem}}
}

