\name{TT.data.test}
\alias{TT.data.test}
\title{Test the validity of some soil texture data table (3 particle size classes). }
\description{Test the validity of some soil texture data table. (1) Test that 
it is a data.frame or matrix, (2) Test that column names contains 
'css.names', (3) Test that there are no missing values, (4) that 
all values are >= 0, (5) That the sum of the 3 particle size classes 
is >= 'text.sum'*(1-'text.tol') or <= 'text.sum'*(1+'text.tol'). 
'tri.data' may contain other variables than the 3 textuer classes 
(ignored).}
\usage{
TT.data.test(tri.data, css.names = NULL, text.sum = NULL, text.tol = NULL, tri.sum.tst = NULL, tri.pos.tst = NULL)
}
\arguments{
  \item{tri.data}{
}
  \item{css.names}{
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



\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}





