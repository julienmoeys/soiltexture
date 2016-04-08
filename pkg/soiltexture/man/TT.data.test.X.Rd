\name{TT.data.test.X}
\alias{TT.data.test.X}
\title{Test the validity of some soil texture data table (X particle size classes). }
\description{Test the validity of some soil texture data table. (1) Test that 
it is a data.frame or matrix, (3) Test that there are no missing 
values, (4) that all values are >= 0, (5) That the sum of the 
X particle size class is >= 'text.sum'*(1-'text.tol') or <= 
'text.sum'*(1+'text.tol'). Contrary to TT.data.test() no test 
are performed for the particle size classes and columns names, so 
'tri.data' should only contains texture data, and nothing else.}
\usage{TT.data.test.X(tri.data, text.sum = NULL, text.tol = NULL, 
    tri.sum.tst = NULL, tri.pos.tst = NULL)}
\arguments{
  \item{tri.data}{
}
  \item{text.sum}{
}
  \item{text.tol}{
}
  \item{tri.sum.tst}{
}
  \item{tri.pos.tst}{
}
}



\author{Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb], Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor Zelazny [ctb],  Rodolfo Marcondes Silva Souza [ctb],  Jose Lucas Safanelli [ctb], Alexandre ten Caten [ctb]}





