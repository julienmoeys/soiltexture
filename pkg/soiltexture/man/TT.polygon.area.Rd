\name{TT.polygon.area}
\alias{TT.polygon.area}
\title{Determines the area of 1 polygon (in x-y coordinates). }
\description{Determines the area of 1 non-intersecting polygon (in x-y 
coordinates). Used by TT.polygon.centroids(). pol.x[1]:pol.y[1] 
is supposed different from pol.x[n]:pol.y[n] (i.e. the polygon 
is NOT closed). 
After "http://local.wasp.uwa.edu.au/~pbourke/geometry/polyarea/
Calculating The Area And Centroid Of A Polygon. Written by 
Paul Bourke, July 1988".}
\usage{TT.polygon.area(pol.x, pol.y)}
\arguments{
  \item{pol.x}{Vector of numericals. X coordinates of each vertices of the 
polygon.}
  \item{pol.y}{Vector of numericals. Y coordinates of each vertices of the 
polygon.}
}

\value{Returns a single numerical: area of the polygon.}

\author{Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb], Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor Zelazny [ctb],  Rodolfo Marcondes Silva Souza [ctb],  Jose Lucas Safanelli [ctb], Alexandre ten Caten [ctb]}





