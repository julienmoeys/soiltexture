\name{TT.text.transf.Xm}
\alias{TT.text.transf.Xm}
\title{Transformations of a soil texture data table between 2 particle size systems (X classes), various methods.}
\description{using various Particle Size Distribution (PSD) models including Anderson (AD), Fredlund4P (F4P), Fredlund3P (F3P),
modified logistic growth (ML), Offset-Nonrenormalized Lognormal (ONL), Offset-Renormalized Lognormal (ORL),
Skaggs (S), van Genuchten type(VG),van Genuchten modified, Weibull (W), Logarithm(L), 
Logistic growth (LG), Simple Lognormal (SL),Shiozawa and Compbell (SC). 
The performance of PSD models is influenced by many aspects like soil texture class,
number and position (or closeness) of observation points, clay content etc.
The latter four PSD models perform worse than the former ten. 
The AD, F4P, S, and W model is recommended for most of texture classes. 
And it will be even better to compare several different PSD models and using the results of the model
with the minimum residual sum of squares (or other measures).
Sometimes, the fitting will failed for the iteration is not converged or some errors happened.
Transformation of a soil texture data table 
('tri.data') from one 
particle size system ('dat.ps.lim') into another 
('base.ps.lim'). No limit in the number of texture classes 
in the input and output texture tables. See TT.text.transf 
for transformation involving only 3 particle classes. 'tri.data' 
can only contain texture data.}
\usage{
TT.text.transf.Xm(tri.data, base.ps.lim, dat.ps.lim, text.sum = NULL, text.tol = NULL, tri.sum.tst = NULL, tri.pos.tst = NULL, psdmodel = "AD", omethod = "all", tri.sum.norm = FALSE)
}
\arguments{
  \item{tri.data}{
}
  \item{base.ps.lim}{
}
  \item{dat.ps.lim}{
}
  \item{text.sum}{
}
  \item{text.tol}{
}
  \item{tri.sum.tst}{
}
  \item{tri.pos.tst}{
}
  \item{psdmodel}{
}
  \item{omethod}{
}
  \item{tri.sum.norm}{
}
}



\author{Wei Shangguan
Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( soiltexture ) 

my.text4 <- data.frame( 
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47), 
    "FSILT" = c(02,04,10,15,25,40,35,20,10,05,10,20), 
    "CSILT" = c(03,04,05,10,30,45,30,25,05,10,07,23), 
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10)  
)   #

TT.text.transf.Xm( 
  tri.data    = my.text4, 
  base.ps.lim = c(0,2,20,50,2000), 
  dat.ps.lim  = c(0,2,20,63,2000),  
  psdmodel    = "S"
)   #

# TT.text.transf.Xm( 
#   tri.data    = my.text4, 
#   base.ps.lim = c(0,1,50,2000), 
#   dat.ps.lim  = c(0,2,30,60,2000),
#   psdmodel    = "AD",
#   omethod     = "Nelder-Mead"  
# ) }
