pkgname <- "soiltexture"
source(file.path(R.home("share"), "R", "examples-header.R"))
options(warn = 1)
options(pager = "console")
library('soiltexture')

assign(".oldSearch", search(), pos = 'CheckExEnv')
cleanEx()
nameEx("TT.plot")
### * TT.plot

flush(stderr()); flush(stdout())

### Name: TT.plot
### Title: Plot soil texture triangles / diagrams.
### Aliases: TT.plot

### ** Examples
require( soiltexture ) 

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

# ::: Test all the languages:

TT.plot( class.sys = "USDA.TT", lang = "en" )  #  English, default 
TT.plot( class.sys = "USDA.TT", lang = "fr" )  #  French 
TT.plot( class.sys = "USDA.TT", lang = "de" )  #  German 
TT.plot( class.sys = "USDA.TT", lang = "se" )  #  Spanish 
TT.plot( class.sys = "USDA.TT", lang = "it" )  #  Italian 
TT.plot( class.sys = "USDA.TT", lang = "nl" )  #  Dutch 
TT.plot( class.sys = "USDA.TT", lang = "fl" )  #  Dutch (Belgian) / Flemmish 
TT.plot( class.sys = "USDA.TT", lang = "se" )  #  Swedish 
TT.plot( class.sys = "USDA.TT", lang = "ro" )  #  Romanian 


cleanEx()
nameEx("TT.points.in.classes")
### * TT.points.in.classes

flush(stderr()); flush(stdout())

### Name: TT.points.in.classes
### Title: Classify a table of soil texture data according to a soil
###   texture triangle.
### Aliases: TT.points.in.classes

### ** Examples
require( "soiltexture" ) 

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
)   #


cleanEx()
nameEx("TT.text.transf.Xm")
### * TT.text.transf.Xm

flush(stderr()); flush(stdout())

### Name: TT.text.transf.Xm
### Title: Transformations of a soil texture data table between 2 particle
###   size systems (X classes), various methods.
### Aliases: TT.text.transf.Xm

### ** Examples
require( "soiltexture" ) 
require( "drc" )

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
# ) 


### * <FOOTER>
###
cat("Time elapsed: ", proc.time() - get("ptime", pos = 'CheckExEnv'),"\n")
grDevices::dev.off()
###
### Local variables: ***
### mode: outline-minor ***
### outline-regexp: "\\(> \\)?### [*]+" ***
### End: ***
quit('no')
