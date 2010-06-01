\name{TT.set}
\alias{TT.set}
\title{Function to change / set the default package parameters. }
\description{Function to change / set the default package parameters as they 
are stored in the list TT.par in the environment TT.env. Use 
this function to change some deafult parameters for all the 
current R cession. Many functions of soiltexture take some of 
their parameter values in TT.par.}
\usage{
TT.set(..., reset = FALSE, par.list = "TT.par", bkp.par.list = "TT.par.bkp", par.env = TT.env)
}
\arguments{
  \item{\dots}{List of parameters and value in the form "par.name1" = par.value1, 
"par.name2" = par.value2... List of parameters to change.}
  \item{reset}{Single logical. If set to TRUE the parameter list is reset to default}
  \item{par.list}{Single character. Name of the list containing the parameters}
  \item{bkp.par.list}{Single character. Name of the backuped list containing the default parameters}
  \item{par.env}{An R environment. Name of the environment containing the parameter lists (no quotes)}
}



\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}





