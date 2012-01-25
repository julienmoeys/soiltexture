\name{TT.text.transf}
\alias{TT.text.transf}
\title{Log-linear transformation of a soil texture data table between 2 particle size systems (3 classes).}
\description{Log-linear transformation of a soil texture data table 
('tri.data') from one 
particle size system ('dat.css.ps.lim') into another 
('base.css.ps.lim'). Only 3 particle size classes allowed. See 
TT.text.transf.X for transformation involving more than 3 
particle classes. 'tri.data' may contain other variables 
(not in 'css.names'). They are returned unchanged with the 
transformed texture data.}
\usage{
TT.text.transf(tri.data,
base.css.ps.lim,
dat.css.ps.lim,
css.names = NULL,
blr.tx = NULL,
text.sum = NULL,
text.tol = NULL,
tri.sum.tst = NULL,
tri.pos.tst = NULL,
trsf.add.opt1 = NULL,
trsf.add.opt2 = NULL)
}
\arguments{
  \item{tri.data}{
}
  \item{base.css.ps.lim}{
}
  \item{dat.css.ps.lim}{
}
  \item{css.names}{
}
  \item{blr.tx}{
}
  \item{text.sum}{
}
  \item{text.tol}{
}
  \item{tri.sum.tst}{
}
  \item{tri.pos.tst}{
}
  \item{trsf.add.opt1}{
}
  \item{trsf.add.opt2}{
}
}



\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>, contributions from Wei Shangguan.}





