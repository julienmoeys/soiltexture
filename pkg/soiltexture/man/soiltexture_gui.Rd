\name{soiltexture_gui}
\alias{soiltexture_gui}
\title{Text-based menu for plotting and classifying soil texture data}
\description{Text-based menu for plotting and classifying soil texture 
data. 

If you simply want to obtain a figure with an 
empty soil texture triangle, just call 
\code{soiltexture_gui}() and follow the instructions.

If you want to a figure with your own soil texture data 
on top of a texture triangle, you must first prepare 
a tabular text file containing your texture data, as 
\code{.txt} or \code{.csv}. Such a file can be prepared 
with \code{MS Excel} or \code{Libre Office}, and exported 
as CSV ("CSV (comma delimited) (*.csv)" or "CSV (MS-DOS) 
(*.csv)" for example). The table \bold{must} contain 
headers (column names) and it \bold{must} the following 
columns and headers: \code{CLAY}, \code{SILT} and 
\code{SAND}. Other columns are allowed and will be ignored. 
In the texture data file, each row represent a record 
(a sample) and each column a variable.

You will be asked about the format of this text file, in 
particular about the field / column separator (it can be 
commas, semi-colons, tabulations or (multiple) spaces) 
and the decimal mark (comma or dot). The file encoding 
can be either the native encoding of the computer, or 
UTF-8 (without BOM).

The sum of the texture of each row must be either 1 (if 
expressed as a fraction) or 100 (if expressed as a 
percentage). You will be asked about the unit. Only small 
divergences from 1 or 100 are allowed, but you will be 
asked if you want to normalise your data beforehand, so 
larger divergences are possible.

You will also be asked which texture classification system 
you want to use (FAO, USDA, etc.). It is possible to 
plot a texture triangle without texture classification.

Finally, if you have chosen a texture classification system, 
\code{soiltexture_gui} can classify each record according 
to this classification system and 
\bold{return you the texture class of each record}, 
as a CSV text file.

The texture triangle is show to you with R default 
graphical device, and you can choose to export a 
PNG figure of the resulting texture triangle (between 
512 and 2048 pixel width/height, depending on what you 
chose).
}
\usage{soiltexture_gui(main = NULL, graphics = FALSE, ...)}
\arguments{
  \item{main}{Single character string. Main title of the texture 
diagram. Set to \code{NA} to obtain a a slightly bigger 
figure, with no title. See \code{\link[soiltexture]{TT.plot}}.}
  \item{graphics}{See \code{\link[utils]{select.list}}.}
  \item{\dots}{Additional parameters passed to 
\code{soiltexture:::.read.table.menu} or 
(subsequently) to \code{\link[utils]{read.table}}.}
}

\value{Either \code{NULL} if no texture data was imported, 
or a \code{\link{data.frame}} (if texture data was 
imported). The texture classification is also returned 
(when the user asked for a texture classification).}

\author{Julien Moeys [aut, cre], Wei Shangguan [ctb], Rainer Petzold [ctb], Budiman Minasny [ctb], Bogdan Rosca [ctb], Nic Jelinski [ctb], Wiktor Zelazny [ctb],  Rodolfo Marcondes Silva Souza [ctb],  Jose Lucas Safanelli [ctb], Alexandre ten Caten [ctb]}




\examples{
library( "soiltexture" )

#   Call the text graphical user interface

soiltexture_gui()

#   ... and follow the instructions indicated to you!}
