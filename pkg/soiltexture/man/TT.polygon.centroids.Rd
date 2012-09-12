\name{TT.polygon.centroids}
\alias{TT.polygon.centroids}
\title{Determines the centroid of 1 polygon (in x-y coordinates). }
\description{Determines the centroid of 1 non-intersecting polygon (in x-y 
coordinates). Used to determine the centroid of each texture 
class in the texture triangle onces its clay silt sand 
coordinates have been converted to x-y coordinates. pol.x[1]:pol.y[1] 
is supposed different from pol.x[n]:pol.y[n] (i.e. the polygon 
is NOT closed). 
After "http://local.wasp.uwa.edu.au/~pbourke/geometry/polyarea/ 
Calculating The Area And Centroid Of A Polygon. Written by 
Paul Bourke, July 1988".}
\usage{TT.polygon.centroids(pol.x, pol.y)}
\arguments{
  \item{pol.x}{Vector of numericals. X coordinates of each vertices of the 
polygon.}
  \item{pol.y}{Vector of numericals. Y coordinates of each vertices of the 
polygon.}
}

\value{Returns a vector of 2 numericals: x and y coordinates of 
the polygon's centroid. Vector items are names "x" and "y". }

\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>, contributions from Wei Shangguan.}





