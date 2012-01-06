\name{TT.plot}
\alias{TT.plot}
\title{Plot soil texture triangles / diagrams.}
\description{Plot a soil texture triangle (also called soil texture 
diagrams, or soil texture ternary plots), with or without 
background soil texture classes boundaries, and with or without
soil texture data points. The triangle geometry depends on the 
soil texture classification system chosen ('class.sys' argument) 
or on 'forcing' parameters (see below). 
Both the boundaries of the background texture classification 
system and the texture data points can be transformed from 
one particle size limits system to another (the particle size 
limits system of the plot). Default behaviour is no transformation 
(set 'css.transf' argument to TRUE to allow transformation). 
There are 3 different way to set the triangle geometry and 
characteristics (1) setting the 'class.sys' argument [lowest 
priority], (2) changing one or several values of the 'geo' 
list of arguments or (3) setting the corresponding arguments 
of TT.plot() [highest priority]. These arguments are "blr.clock", 
"tlr.an", "blr.tx", "text.sum", and "base.css.ps.lim". Different 
geometry arguments can be set at different levels (1, 2 or 3). 
Case (1) should be used when one wants to use the 'default' triangle 
geometry associated with a given texture classification system 
(chosen with the 'class.sys' argument). Case (2) should be used 
when TT.plot() has been called previously, with a call like 
geo <- TT.plot(), so the 'geo' object returned can be used 
for setting the geometry of a new texture triangle TT.plot( 
geo = geo ) identical to the previous one. Case (3) should be 
used whenever the user wants to set the geometry of a texture 
triangle plot different from default values of the texture 
classification system chosen, and without re-using the geometry 
from a previous plot. 
ON DEFAULT VALUES OF TT.plot() ARGUMENTS? As TT.plot() shares 
its arguments with many other functions, their default value 
is not defined in TT.plot() source code, but rather in 
a dedicated list object called 'TT.par' and stored in the 
environment TT.env. The function TT.get() is used to retrieve 
the default value of the arguments defined in TT.par (see 
?TT.get). For instance, to know the default value of 'class.sys', 
you can type TT.get("class.sys"). To set a different default 
value for a given argument in R, use TT.set() (see ?TT.set). 
For instance to change the default value of 'class.sys', type 
TT.set( "class.sys" = "USDA.TT" ).}
\usage{
TT.plot(geo = NULL, tri.data = NULL, add = FALSE, css.names = NULL, z.name = NULL, main = NULL, blr.tx = NULL, css.lab = NULL, text.sum = NULL, base.css.ps.lim = NULL, tri.css.ps.lim = NULL, dat.css.ps.lim = NULL, css.transf = NULL, text.transf.fun = NULL, trsf.add.opt1 = NULL, trsf.add.opt2 = NULL, unit.ps = NULL, unit.tx = NULL, blr.clock = NULL, tlr.an = NULL, font = NULL, font.axis = NULL, font.lab = NULL, font.main = NULL, bg = NULL, fg = NULL, col = NULL, col.axis = NULL, col.lab = NULL, col.main = NULL, cex = NULL, cex.axis = NULL, cex.lab = NULL, cex.main = NULL, lwd = NULL, lwd.axis = NULL, lwd.lab = NULL, family.op = NULL, frame.bg.col = NULL, at = NULL, grid.show = NULL, grid.col = NULL, grid.lty = NULL, class.sys = NULL, class.lab.show = NULL, class.lab.col = NULL, class.line.col = NULL, class.p.bg.col = NULL, class.p.bg.hue = NULL, arrows.show = NULL, arrows.lty = NULL, points.type = NULL, pch = NULL, z.type = NULL, z.col.hue = NULL, z.cex.range = NULL, z.pch = NULL, text.tol = NULL, tri.sum.tst = NULL, tri.pos.tst = NULL, b.lim = NULL, l.lim = NULL, lang = NULL, new.mar = NULL, new.centroid = TRUE)
}
\arguments{
  \item{geo}{List. 'geo' is one of the 3 way to set the texture triangle 
geometry. See there description and hierarchy in the function 
description. If geo != NULL, then geo must be 
a list containing 1 or several of the following items: 
"blr.clock", "tlr.an", "blr.tx", "text.sum", and "base.css.ps.lim". 
See the options with the same name for a description of the 
expected values and effects. The list can be created manually 
(like list( "text.sum" = 1000 ) ), or taken from the output of 
a previous call to TT.plot(), TT.baseplot() or TT.geo.get() 
(that return a 'geo' list).}
  \item{tri.data}{Data frame. Data frame containing the CLAY, SILT and SAND 
'coordinates' of the texture data points to be plotted on top 
of the texture triangle and texture class boundaries. The data 
frame can contain more column than needed (ignored). The data 
frame must have column named CLAY, SILT and SAND (uppercase, 
the order has no importance) or named after the 'css.names' 
argument (alternative names). If 'z.name' argument is not NULL, 
the data frame must also contain a column named after 'z.name' 
value. The sum of CLAY, SILT and SAND must be equal to 'text.sum' 
('text.tol' determines the error tolerance).}
  \item{add}{Single logical. If FALSE, a new plot is created. If FALSE, 
the plot is added to the existing one.}
  \item{css.names}{Vector of 3 character strings. Name of the columns in 'tri.data' 
that contains the CLAY SILT and SAND values, respectively. 
If NULL, default c("CLAY","SILT","SAND") value is assumed. Not 
to be confused with 'css.lab' that defines the labels of the 
CLAY SILT and SAND axes in the plot.}
  \item{z.name}{Single character string. Name of the column in 'tri.data' 
that contains the '4th quantitative variable' whose value 
must be used to define the points expansion factor and 
color (bubble plot). If NULL, a simple plot is drawn (no 
'bubbles')}
  \item{main}{Single character string or expression. Main title of the plot.}
  \item{blr.tx}{Vector of 3 character strings. The 1st, 2nd and 3rd values must 
be either CLAY, SILT or SAND, and determines the particle size classes 
associated with the BOTTOM, LEFT and RIGHT axis, respectively. 
CLAY, SILT and SAND order in the vector is free, but they should 
all be used one time. The CLAY, SILT and SAND names must appear 
whatever the corresponding columns names in 'tri.data' (eventually 
set by 'css.names') and whatever the labels of the axis in the 
plot (eventually set by 'css.lab') }
  \item{css.lab}{Vector of 3 character strings or 3 expressions. The 1st, 2nd 
and 3rd values must be text strings or expressions, and determines 
the axes plot labels for the CLAY, SILT and SAND particle size classes, 
respectively. 'css.lab' values are independent from columns 
names in 'tri.data' (eventually set by 'css.names') and from 
whatever the placement of particle size classes on each axis 
(eventually set by 'blr.tx') }
  \item{text.sum}{Single numerical. Sum of the 3 particle size classes for each texture 
value (fixed). The real sum of the 3 particle size classes in 'tri.data' 
should be >= text.sum * (1-text.tol) OR  <= text.sum * (1+text.tol), 
where 'text.tol' is an argument that can be changed. If some 
of the texture values don't match this requirement, an error 
occur (function fails) and TT.plot returns a of bad values with 
their actual particle size classes sum. You can 'normalise' you data 
table () prior to the use of TT.plot, by using the function 
TT.normalise.sum(), so all values match the 'text.sum' criteria. 
See also 'tri.sum.tst' that can be set to FALSE to avoid 
sum of particle size classes tests.}
  \item{base.css.ps.lim}{Vector of 4 numericals. Particle size boundaries (upper and lower) 
of the 3 particle size classes (CLAY, SILT and SAND, starting from 
the lower size of CLAY particles, 0, to the upper size of the 
SAND particles, 2000), in micrometers, FOR THE BASE PLOT. These 
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
  \item{unit.ps}{Single text string or expression. Unit of particle size class 
limits displayed on the plot (= part of the axis labels). Does 
not affect the other calculations. Default micrometers.}
  \item{unit.tx}{Single text string or expression. Unit of particle texture values
displayed on the plot (= part of the axis labels). Does 
not affect the other calculations. Default is percentage.}
  \item{blr.clock}{Vector of logicals, eventually with NA values. Direction of 
increasing texture values on the BOTTOM, LEFT and RIGHT axis, 
respectively. A value of TRUE means that the axis direction is 
clockwise. A value of FALSE means that the axis direction is 
counterclockwise. A value of NA means that the axis direction 
is centripetal. Possible combinations are c(T,T,T); c(F,F,F); 
c(F,T,NA) and c(T,NA,F), for fully clockwise, fully counterclockwise, 
right centripetal and left centripetal orientations, respectively.}
  \item{tlr.an}{Vector of numericals. Value - in degrees - of the TOP, LEFT and 
RIGHT angles of the triangle. Any value between 0 and 90 is possible, 
but values belonging to 0 or 45 or 60 or 90 give a better graphical 
rendering.}
  \item{font}{Single integer. Not used yet.}
  \item{font.axis}{Single integer. Same definition as par("font.axis"). Font of 
the triangle axis's numbering.}
  \item{font.lab}{Single integer. Same definition as par("font.lab"). Font of 
the triangle axis's labels.}
  \item{font.main}{Single integer. Same definition as par("font.main"). Font of 
the triangle main title.}
  \item{bg}{Text string containing an R color code. Background color of the 
plot (= outside the triangle). See 'frame.bg.col' for the background 
color inside the triangle frame.}
  \item{fg}{Text string containing an R color code. DEPRECATED. foreground 
color of the plot (= point fill color).}
  \item{col}{Text string containing an R color code. Same definition as par("col"). Color 
of the points plotted in the triangle.}
  \item{col.axis}{Text string containing an R color code. Color of the triangle's 
axis (line and tics) The color of the texture classes boundaries 
is set by 'class.line.col'.}
  \item{col.lab}{Text string containing an R color code. Color of the triangle's 
labels (text) and arrows. The color of the texture classes labels 
is set by 'class.lab.col'.}
  \item{col.main}{Text string containing an R color code. Color of the main title.}
  \item{cex}{Vector of numerical or single numerical. Same definition as par("cex"). 
Expansion factor for the points plotted on the triangle.}
  \item{cex.axis}{Single numerical. Same definition as par("cex.axis"). Expansion factor for 
the axis tics labels (numbering).}
  \item{cex.lab}{Single numerical. Same definition as par("cex.lab"). Expansion factor for 
the axis labels AND the texture classes labels.}
  \item{cex.main}{Single numerical. Same definition as par("cex.main"). Expansion factor for the 
main title. }
  \item{lwd}{Single numerical. Same definition as par("lwd"). Line width for 
the graphical elements inside the triangle (points plotted).}
  \item{lwd.axis}{Single numerical. Same definition as par("lwd.axis"). Line width 
for the axis lines, tics and the grid lines inside the triangle.}
  \item{lwd.lab}{Single numerical. Same definition as par("lwd"). Line width for 
the direction arrows.}
  \item{family.op}{Single text string. Same definition as par("family"). Font type 
to be used in the plot text elements (title, labels)}
  \item{frame.bg.col}{Text string containing an R color code. Background color of the 
triangle plot (= inside the triangle). See 'bg' for the background 
color outside the triangle frame.}
  \item{at}{Vector of numericals. Location of the grid line start points 
on all 3 triangles axis. At the moment values are identical for 
all 3 axis, and changes to that parameter have not been tested. }
  \item{grid.show}{Single logical. If set to TRUE (the default) a grid is drawn 
on the background of the texture triangle. Set to FALSE to 
remove the grid.}
  \item{grid.col}{Text string containing an R color code. Color of the grid lines. 
If equal to NULL, then an appropriate color is used. Appropriate 
means (i) if 'class.p.bg.col' is FALSE (no color gradient in 
texture class polygons), then grid.col is equal to 'bg' (without
transparency) unless a color is specified for the triangle 
frame background ('frame.bg.col'), in which case grid.col is a 
mix of 'frame.bg.col' and 'col.axis'. (ii) if 'class.p.bg.col' 
is TRUE, then grid.col is a light or dark color based on 
'class.p.bg.hue' (light if 'bg' is dark and dark if 'bg' is light).}
  \item{grid.lty}{Single numerical. Line type of the grid lines (same types as 
par("lty")).}
  \item{class.sys}{Single text string. Text code of the texture classification 
system to be plotted on the background of the texture triangle. 
That texture classification system will determines the triangle 
geometry and particle class size system of the plot, unless 
higher level options are chosen (see the function definition). 
Possible values are "none" (no classification plotted), "USDA.TT" 
(USDA texture triangle), "FAO50.TT" (FAO texture triangle with a 50 
microns silt-sand limit. DEFAULT VALUE), "FR.AISNE.TT" (French 
texture triangle 
of the Aisne region soil survey), "FR.GEPPA.TT" (French GEPPA 
texture triangle), "DE.BK94.TT" (German texture triangle), 
"UK.SSEW.TT" (Soil Survey of England and Wales), "AU.TT" 
(Australian texture triangle), "BE.TT" (Belgium texture triangle), 
"CA.EN.TT" (Canadian texture triangle, with English class abbreviations) and 
"CA.FR.TT" (Canadian texture triangle, with French class abbreviations).}
  \item{class.lab.show}{Single text string. If equal to "abr" (default) or "full", labels 
are drawn inside texture class polygons with their full name 
("full") or abbreviated name ("abr"). If equal to "none", no label 
is drawn.}
  \item{class.lab.col}{Text string containing an R color code. Color of the text label 
drawn inside texture class polygons.}
  \item{class.line.col}{Text string containing an R color code. Color of the texture 
class polygon boundary lines. }
  \item{class.p.bg.col}{Single logical OR vector of R colors (character strings). 
If FALSE (the default), no color gradient 
is used inside the texture class polygons. If TRUE, a color 
gradient is drawn, with the color hue specified in 'class.p.bg.hue' 
and with saturation and values that vary with texture. If 
'class.p.bg.col' is a vector of R colors of the same length 
as the number of classes in the triangle, these colors 
will be used as background color for each texture classe plygons.}
  \item{class.p.bg.hue}{Single numerical. Only used if class.p.bg.col == TRUE (no default). 
Color hue (between 0 and 1) used to create a color gradient 
between the different texture class polygons.}
  \item{arrows.show}{Single logical. If TRUE (default), 3 arrows are drawn outside 
the triangle, along each axis, that show the direction of 
increasing values (arrow base) and of isovalue (arrow tip) 
of the texture class. If FALSE no arrows are drawn.}
  \item{arrows.lty}{Single numerical. Line type of the arrows drawn outside 
the triangle, along each axis. Same possible types as par("lty").}
  \item{points.type}{Single text letter. Point type. Either "p" (points only), "l" 
(lines only) or "b" (both points and lines), as for plot() or 
points(). Point refer here to soil texture values plotted on 
the triangle.}
  \item{pch}{Single numerical or vector of numericals, or single text string 
or vector of text string. Point shape number(s) or point character(s) 
to be plotted. Point refer here to soil texture values plotted on 
the triangle.}
  \item{z.type}{Single character string. Type of plot to be used for displaying 
a 4th variable on the texture triangle (in addition to Clay, 
Silt and Sand). Only used if 'z.name' is not NULL. Currently 
only one value is supported, "bubble", for displaying a bubble 
plot with bubble sizes and color saturation and values proportional 
to the value of tri.data[,z.name]. 
The value 'map' is deprecated and replaced by TT.iwd(), TT.image() or 
TT.contour().}
  \item{z.col.hue}{Single numerical. Hue of the bubble color ([0-1]) to be used 
if 'z.name' is not NULL. A gradient of saturation and value is 
automatically created for the bubbles (with this hue). }
  \item{z.cex.range}{Vector of 2 numericals. Minimum and maximum 'cex' of the bubbles 
plotted on the triangle if 'z.name' is not NULL. }
  \item{z.pch}{Single numerical or vector of numericals. Point symbol number(s) 
to be used for the bubbles if 'z.name' is not NULL. }
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
  \item{b.lim}{Vector of 2 numerical values. This is an equivalent to plot() 
xlim argument. Minimum and maximum x / bottom value of the 
texture triangle area, in FRACTION OF THE MAXIMAL EXTENSION. 
Default is c(0,1). The real span is then b.lim * text.sum. 
This is a minimal 'zoom' implementation (results are not 
always perfect). 'b.lim' and 'l.lim' should be equal for 
better rendering.}
  \item{l.lim}{Vector of 2 numerical values. This is an equivalent to plot() 
ylim argument. Minimum and maximum y / left value of the 
texture triangle area, in FRACTION OF THE MAXIMAL EXTENSION. 
Default is c(0,1). The real span is then l.lim * text.sum. 
This is a minimal 'zoom' implementation (results are not 
always perfect). 'b.lim' and 'l.lim' should be equal for 
better rendering.}
  \item{lang}{Single text string. Determines the language used for the plot 
main title and axis labels. Possible values are 'en' (English, 
the default), "fr" (French), "it" (Italian), "es" (Spanish), 
"de" (German), "nl" (Dutch), "se" (Swedish) and "fl" (Flemish).}
  \item{new.mar}{Vector of 4 numericals. Margin sizes of the plot. Default is 
the same as par("mar"). See par("mar") for more details. Use 
this at your own risks!}
  \item{new.centroid}{Single logical. If TRUE (default) the new method (Paul Bourke) 
is used to calculate the centroid. If FALSE the centroid is 
taken as the mean x and y coordinates of the vertices.}
}



\author{Julien MOEYS <jules_m78-soiltexture@yahoo.fr>}




\examples{require( soiltexture ) 

# ::: Texture triangles without data

# :: Base plot (FAO triangle) 
TT.plot() 

# same as
TT.plot( class.sys = "FAO50.TT" ) 

# :: Same plot, but with USDA texture triangle 
TT.plot( class.sys = "USDA.TT" ) 

# :: Same plot, but with a color gradient 
TT.plot( 
    class.sys       = "USDA.TT", 
    class.p.bg.col  = TRUE
)   #

# :: No texture classification system
TT.plot( class.sys = "none" ) 

# ::: Texture triangles with texture data 

# :: 1st create a dummy texture dataset 
my.text <- data.frame( 
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47), 
    "SILT"  = c(05,08,15,25,55,85,65,45,15,15,17,43), 
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10), 
    "OC"    = c(20,14,15,05,12,15,07,21,25,30,05,28)  
)   #

# :: And plot it on a French Aisne texture triangle
#    with a title
TT.plot( 
    class.sys   = "FR.AISNE.TT", 
    tri.data    = my.text, 
    main        = "Soil texture data" 
)   #

# ::: Bubble plots (4th variable) 

# :: 1st generate a dummy texture dataset with a 4th variable 
#    with TT.dataset() 
rand.text   <- TT.dataset( n = 100, seed.val = 1980042401 ) 

# :: Plot the dummy dataset as a bubble plot
TT.plot( 
    class.sys   = "none", 
    tri.data    = rand.text, 
    z.name      = "Z", 
    main        = "Soil texture triangle and Z bubble plot" 
)   #

# ::: Test all the texture triangles

TT.plot( class.sys = "none" )           # no classification 
TT.plot( class.sys = "FAO50.TT" )       # FAO 
TT.plot( class.sys = "USDA.TT" )        # USDA 
TT.plot( class.sys = "FR.AISNE.TT" )    # French Aisne 
TT.plot( class.sys = "FR.GEPPA.TT" )    # French GEPPA 
TT.plot( class.sys = "DE.BK94.TT" )     # Germany 
TT.plot( class.sys = "UK.SSEW.TT" )     # UK 
TT.plot( class.sys = "BE.TT" )          # Belgium 
TT.plot( class.sys = "CA.FR.TT" )       # Canada (fr) 
TT.plot( class.sys = "CA.EN.TT" )       # Canada (en) 
TT.plot( class.sys = "AU.TT" )          # Australian 
TT.plot( class.sys = "ISSS.TT" )        # ISSS 
TT.plot( class.sys = "ROM.TT" )         # Romanian 
TT.plot( class.sys = "PL.TT" )          # Polish 
TT.plot( class.sys = "DE.SEA74.TT" )    # German SEA 1974 
TT.plot( class.sys = "DE.TGL85.TT" )    # German TGL 1985 


# ::: Test all the languages:

TT.plot( class.sys = "USDA.TT", lang = "en" )  #  English, default 
TT.plot( class.sys = "USDA.TT", lang = "fr" )  #  French 
TT.plot( class.sys = "USDA.TT", lang = "de" )  #  German 
TT.plot( class.sys = "USDA.TT", lang = "es" )  #  Spanish 
TT.plot( class.sys = "USDA.TT", lang = "it" )  #  Italian 
TT.plot( class.sys = "USDA.TT", lang = "nl" )  #  Dutch 
TT.plot( class.sys = "USDA.TT", lang = "fl" )  #  Dutch (Belgian) / Flemmish 
TT.plot( class.sys = "USDA.TT", lang = "se" )  #  Swedish 
TT.plot( class.sys = "USDA.TT", lang = "ro" )  #  Romanian 
TT.plot( class.sys = "USDA.TT", lang = "pl" )  #  Polish 
}
