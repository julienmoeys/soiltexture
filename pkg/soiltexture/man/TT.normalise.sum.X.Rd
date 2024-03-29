% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soiltexture.R
\name{TT.normalise.sum.X}
\alias{TT.normalise.sum.X}
\title{Normalises the sum of the X particle size classes.}
\usage{
TT.normalise.sum.X(
  tri.data,
  text.sum = NULL,
  text.tol = NULL,
  tri.pos.tst = NULL,
  residuals = FALSE
)
}
\arguments{
\item{tri.data}{See \code{\link[soiltexture]{TT.plot}}}

\item{text.sum}{See \code{\link[soiltexture]{TT.plot}}}

\item{text.tol}{See \code{\link[soiltexture]{TT.plot}}}

\item{tri.pos.tst}{See \code{\link[soiltexture]{TT.plot}}}

\item{residuals}{If TRUE the residuals are calculated and added to the returned data.frame}
}
\description{
Normalises the sum of the X particle size classes in tri.data to text.sum
(100\%).
}
\author{
Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb],
Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor
Zelazny [ctb], Rodolfo Marcondes Silva Souza [ctb], Jose Lucas Safanelli
[ctb], Alexandre ten Caten [ctb]
}
