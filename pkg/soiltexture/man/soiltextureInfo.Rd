\name{soiltextureInfo}
\alias{soiltextureInfo}
\title{Display and / or export system and package version information}
\description{Display and / or export system and package version information. 
Can be used to provide an overview of the system and the R 
packages that were used to produce some calculations, thus 
improving the traceability of that work in the long run.}
\usage{soiltextureInfo(file = NULL, verbose = TRUE, depends = FALSE, 
    md5 = TRUE, packages = "soiltexture")}
\arguments{
  \item{file}{Single character string. Name of the text file (with or without 
its path) in which the information will be exported. If 
\code{NULL} (default), information are not exported.}
  \item{verbose}{Single logical value. If \code{TRUE}, information are displayed 
on the screen.}
  \item{depends}{Single logical value. If \code{TRUE}, information on packages 
dependencies are also displayed, in the same way}
  \item{md5}{Single logical value. If \code{TRUE}, the package MD5 checksums 
are returned too}
  \item{packages}{Single character string. Name of the package whose information 
must be returned.}
}

\value{Invisibly returns the information as a vector of character 
strings}

\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>, contributions from Wei Shangguan.}



\seealso{The base functions that were used internally to compile 
the information: \code{\link[base]{Sys.time}}, 
\code{\link[base]{Sys.info}}, \code{\link[base]{version}}, 
\code{\link[base]{.packages}}, 
\code{\link[utils]{installed.packages}}, 
\code{\link[tools]{package_dependencies}}. See also the 
\code{MD5} file in each package directory (and 
\code{\link[tools]{md5sum}} for generating these MD5 checksums).}
\examples{
library( "soiltexture" )

#   Temporary file where the info will be exported:
f <- tempfile() 

#   Generate package information
soiltextureInfo( file = f, depends = TRUE, verbose = FALSE )

#   Read again the info (as for verbose = TRUE)
cat( readLines( f ), sep = "\n" ) 
unlink( f )

#   Also works with other packages
soiltextureInfo( packages = "sp" )
}
