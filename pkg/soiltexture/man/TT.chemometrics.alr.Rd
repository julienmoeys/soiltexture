\name{TT.chemometrics.alr}
\alias{TT.chemometrics.alr}
\title{Compute the additive log-ratio transformation of compositional data.}
\description{Function that compute the additive 
log-ratio transformation of compositional data (here texture 
data). This a a copy-paste-and-rename of the alr function provided 
by the package chemometrics: P. Filzmoser and K. Varmuza (2008). 
chemometrics: Multivariate Statistical Analysis in Chemometrics. 
R package version 0.4.
The function has been modified so it returns NA when a value 
is below or equal to zero (this happens when using a regular 
grid of texture data, for practical reasons).
The function has also been modified so it uses column name
rather than column index.}
\usage{TT.chemometrics.alr(X, divisorvar, css.names)}
\arguments{
  \item{X}{
}
  \item{divisorvar}{
}
  \item{css.names}{
}
}



\author{Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb], Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor Zelazny [ctb],  Rodolfo Marcondes Silva Souza [ctb],  Jose Lucas Safanelli [ctb], Alexandre ten Caten [ctb]}





