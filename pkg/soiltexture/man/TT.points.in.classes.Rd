\name{TT.points.in.classes}
\alias{TT.points.in.classes}
\title{Classify a table of soil texture data according to a soil texture triangle.}
\description{The function calculate in which classe(s) of a texture triangle 
(classification system defined by 'class.sys') lies each soil 
sample (with texture data) in the table 'tri.data'. As a sample 
may lie inside a texture class, but also at the edge of 2 or 
more texture classes, the function does not only output 
one single texture class per sample. If 'PiC.type' is 'n' or 
'l', it rather output a table where each column is a texture 
class and each row a texture sample, and yes / no information 
about the belonging of the sample to each texture class. 
Alternatively, If 'PiC.type' is 't'it will output a text 
string (per sample) containing all the texture classes 
to which that point belong.
The texture data in 'tri.data' can be transformed into 
another particle size system prior to their classification 
if needed. See the options  base.css.ps.lim, tri.css.ps.lim, 
dat.css.ps.lim, css.transf and text.transf.fun.
ON DEFAULT VALUES OF TT.points.in.classes() ARGUMENTS? As 
TT.points.in.classes() shares 
its arguments with many other functions, their default value 
is not defined in TT.points.in.classes() source code, but rather in 
a dedicated list object called 'TT.par' and stored in the 
environment TT.env. The function TT.get() is used to retrieve 
the default value of the arguments defined in TT.par (see 
?TT.get). For instance, to know the default value of 'class.sys', 
you can type TT.get("class.sys"). To set a different default 
value for a given argument in R, use TT.set() (see ?TT.set). 
For instance to change the default value of 'class.sys', type 
TT.set( "class.sys" = "USDA.TT" ).}
\usage{
TT.points.in.classes(tri.data, class.sys = NULL, PiC.type = NULL, css.names = NULL, text.sum = NULL, base.css.ps.lim = NULL, tri.css.ps.lim = NULL, dat.css.ps.lim = NULL, css.transf = NULL, text.transf.fun = NULL, trsf.add.opt1 = NULL, trsf.add.opt2 = NULL, text.tol = NULL, tri.sum.tst = NULL, tri.pos.tst = NULL, collapse = ", ", texture2xy = FALSE, blr.tx = NULL, blr.clock = NULL)
}
\arguments{
  \item{tri.data}{Data frame. Data frame containing the CLAY, SILT and SAND 
'coordinates' of the texture data points to be classified The data 
frame can contain more column than needed (ignored). The data 
frame must have column named CLAY, SILT and SAND (uppercase, 
the order has no importance) or named after the 'css.names' 
argument (alternative names). The sum of CLAY, SILT and SAND 
must be equal to 'text.sum' 
('text.tol' determines the error tolerance).}
  \item{class.sys}{Single text string. Text code of the texture classification 
system to be used for the classification of 'tri.data'. 
Possible values are "none" (no classification plotted), "USDA.TT" 
(USDA texture triangle), "FAO50.TT" (FAO texture triangle with a 50 
microns silt-sand limit. DEFAULT VALUE), "FR.AISNE.TT" (French 
texture triangle of the Aisne region soil survey), "FR.GEPPA.TT" (French GEPPA 
texture triangle), "DE.BK94.TT" (German texture triangle), 
"UK.SSEW.TT" (Soil Survey of England and Wales), "AU.TT" 
(Australian texture triangle), "BE.TT" (Belgium texture triangle), 
"CA.EN.TT" (Canadian texture triangle, with English class abbreviations) and 
"CA.FR.TT" (Canadian texture triangle, with French class abbreviations)
(see the package vignette for a complete list).}
  \item{PiC.type}{Single character string. If equal to 'n', then a table of 0, 
1, 2 or 3 is outputed (0 if the sample does not belong to a class, 
1 if it does, 2 if it lies on an edge and 3 if it lies on a 
vertex). Notice that the accuracy of the classification is 
not garanteed for samples lying very close to an edge, or right 
on it. See <http://www.mail-archive.com/r-help@r-project.org/msg96180.html>}
  \item{css.names}{Vector of 3 character strings. Name of the columns in 'tri.data' 
that contains the CLAY SILT and SAND values, respectively. 
If NULL, default c("CLAY","SILT","SAND") value is assumed. Not 
to be confused with 'css.lab' that defines the labels of the 
CLAY SILT and SAND axes in the plot.}
  \item{text.sum}{Single numerical. Sum of the 3 particle size classes for each texture 
value (fixed). The real sum of the 3 particle size classes in 'tri.data' 
should be >= text.sum * (1-text.tol) OR  <= text.sum * (1+text.tol), 
where 'text.tol' is an argument that can be changed. If some 
of the texture values don't match this requirement, an error 
occur (function fails) and TT.points.in.classes returns a of bad values with 
their actual particle size classes sum. You can 'normalise' you data 
table () prior to the use of TT.points.in.classes, by using the function 
TT.normalise.sum(), so all values match the 'text.sum' criteria. 
See also 'tri.sum.tst' that can be set to FALSE to avoid 
sum of particle size classes tests.}
  \item{base.css.ps.lim}{Vector of 4 numericals. Particle size boundaries (upper and lower) 
of the 3 particle size classes (CLAY, SILT and SAND, starting from 
the lower size of CLAY particles, 0, to the upper size of the 
SAND particles, 2000), in micrometers, FOR THE BASE SYSTEM. These 
particles size class limits are the references and all other 
texture values with different limits will be converted into 
that reference if (and only if) css.transf == TRUE (not default). 
If NULL, 'base.css.ps.lim' will be set to the default value of the 
texture classification system chosen ('class.sys'). The 
transformation function is set by 'text.transf.fun' and is 
a log-linear interpolation by default.}
  \item{tri.css.ps.lim}{Vector of 4 numericals. Particle size boundaries (upper and lower) 
of the 3 particle size classes (CLAY, SILT and SAND, starting from 
the lower size of CLAY particles, 0, to the upper size of the 
SAND particles, 2000), in micrometers, FOR THE TEXTURE TRIANGLE. 
If not NULL, different from 'base.css.ps.lim', and 
css.transf == TRUE (not default), then the CLAY SILT and SAND 
coordinates of the texture triangle will be converted into 
the 'base.css.ps.lim' reference. If NULL, 'tri.css.ps.lim' will 
be set to the default value of the texture classification system 
chosen ('class.sys'). The transformation function is set by 
'text.transf.fun' and is a log-linear interpolation by default.}
  \item{dat.css.ps.lim}{Vector of 4 numericals. Particle size boundaries (upper and lower) 
of the 3 particle size classes (CLAY, SILT and SAND, starting from 
the lower size of CLAY particles, 0, to the upper size of the 
SAND particles, 2000), in micrometers, FOR THE TEXTURE DATA TABLE
('tri.data'). If not NULL, different from 'base.css.ps.lim', and 
css.transf == TRUE (not default), then the CLAY SILT and SAND 
coordinates of the texture data in tri.data will be converted into 
the 'base.css.ps.lim' reference. If NULL, 'tri.css.ps.lim' will 
be set to the default value of the texture classification system 
chosen ('class.sys'). The transformation function is set by 
'text.transf.fun' and is a log-linear interpolation by default.}
  \item{css.transf}{Single logical. Set to TRUE to transform the texture coordinates 
of the texture triangle ('class.sys') or the texture data 
('tri.data') into the base particle size class limits. 
See 'base.css.ps.lim' for the base plot particle size class limits, 
'tri.css.ps.lim' for the triangle particle size class limits 
and 'dat.css.ps.lim' for the data table particle size class limits. 
The transformation function is set by 'text.transf.fun' and 
is a log-linear interpolation by default. The default value is 
FALSE, so no transformation is made.}
  \item{text.transf.fun}{R function with the same argument names and same output as 
the function TT.text.transf(). 'text.transf.fun' is the function 
that transform the texture values from one system of particle 
class size limits to another. Only used if css.transf == TRUE. 
Default value is text.transf.fun=TT.text.transf. See also 
'base.css.ps.lim', 'tri.css.ps.lim' and 'dat.css.ps.lim'.}
  \item{trsf.add.opt1}{Non pre-defined format. If the user specifies its own texture 
transformation function in 'text.transf.fun' (not TT.text.transf()), 
then he can use 'trsf.add.opt1' and 'trsf.add.opt1' as 
new, additional, argument for his function. So the format of 
'trsf.add.opt1' depends on the function defined by the user 
in 'text.transf.fun'.}
  \item{trsf.add.opt2}{Non pre-defined format. If the user specifies its own texture 
transformation function in 'text.transf.fun' (not TT.text.transf()), 
then he can use 'trsf.add.opt1' and 'trsf.add.opt1' as 
new, additional, argument for his function. So the format of 
'trsf.add.opt1' depends on the function defined by the user 
in 'text.transf.fun'.}
  \item{text.tol}{Single numerical. Tolerance on the sum of the 3 particle size classes. 
The real sum of the 3 particle size classes in 
'tri.data' should be >= text.sum * (1-text.tol) OR 
<= text.sum * (1+text.tol). See 'text.sum' for more details, as 
well as 'tri.sum.tst' (to prevent texture sum tests).}
  \item{tri.sum.tst}{Single logical. If TRUE (the default), the sum of the 3 texture 
classes of each texture value in 'tri.data' will be checked 
in regard to 'text.sum' and 'text.tol'. If FALSE, no test 
is done.}
  \item{tri.pos.tst}{Single logical. If TRUE (the default), the position of texture 
values in 'tri.data' are tested to check that they are not 
OUTSIDE the texture triangle (i.e. that some texture values may 
be negative).}
  \item{collapse}{Single character string. If PiC.type = "t" and a sample lie 
on the edge of 2 texture classes, then both will be outputed 
in a single character string, separated by 'collapse'. Example of 
output: [1] "C" "VF, F" "C" "C" "M"}
  \item{texture2xy}{Single logical. Set to FALSE to avoid any transformation of the 
texture data (trigonometric) prior to testure data classification. 
Setting to FALSE avoid some numerical accuracy problems when 
a point is on the border of a texture class.}
  \item{blr.tx}{Vector of 3 character strings. The 1st, 2nd and 3rd values must 
be either CLAY, SILT or SAND, and determines the particle size classes 
associated with the BOTTOM, LEFT and RIGHT axis, respectively. 
CLAY, SILT and SAND order in the vector is free, but they should 
all be used one time. The CLAY, SILT and SAND names must appear 
whatever the corresponding columns names in 'tri.data' (eventually 
set by 'css.names') and whatever the labels of the axis in the 
plot (eventually set by 'css.lab') }
  \item{blr.clock}{Vector of logicals, eventually with NA values. Direction of 
increasing texture values on the BOTTOM, LEFT and RIGHT axis, 
respectively. A value of TRUE means that the axis direction is 
clockwise. A value of FALSE means that the axis direction is 
counterclockwise. A value of NA means that the axis direction 
is centripetal. Possible combinations are c(T,T,T); c(F,F,F); 
c(F,T,NA) and c(T,NA,F), for fully clockwise, fully counterclockwise, 
right centripetal and left centripetal orientations, respectively.}
}



\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( "soiltexture" ) 

# Create a dummy data frame of soil textures:
my.text <- data.frame( 
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47), 
    "SILT"  = c(05,08,15,25,55,85,65,45,15,15,17,43), 
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10), 
    "OC"    = c(20,14,15,05,12,15,07,21,25,30,05,28)  
)   #

# Display the table:
my.text

# Classify according to the FAO classification
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT"  
)   #

# Classify according to the USDA classification
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "USDA.TT"  
)   #

# Classify according to the FAO classification, returns logicals
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT", 
    PiC.type    = "l" 
)   #

# Classify according to the FAO classification, returns text
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT", 
    PiC.type    = "t" 
)   #

# Classify according to the FAO classification, returns text, 
#   custom class separator in case of points belonging to 
#   several classes.
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT", 
    PiC.type    = "t", 
    collapse    = ";"
)   #}
