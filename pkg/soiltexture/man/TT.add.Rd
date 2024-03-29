% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/soiltexture.R
\name{TT.add}
\alias{TT.add}
\title{Function to add a new default package parameters.}
\usage{
TT.add(..., par.list = "TT.par", bkp.par.list = "TT.par.bkp", par.env = TT.env)
}
\arguments{
\item{\dots}{parameters to be changed in format: "parameter_name1" = new_value1, "parameter_name2" = new_value2}

\item{par.list}{Name of the list containing the parameters}

\item{bkp.par.list}{Name of the backuped list containing the default parameters}

\item{par.env}{name of the environment containing the parameter lists}
}
\description{
Function to add a new default package parameters. Mostly used to add a new
texture triangle definition.
}
\author{
Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb],
Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor
Zelazny [ctb], Rodolfo Marcondes Silva Souza [ctb], Jose Lucas Safanelli
[ctb], Alexandre ten Caten [ctb]
}
