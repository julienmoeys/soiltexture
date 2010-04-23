###################################################
### chunk number 1: 
###################################################
# Set a few Sweave options:
options( 
    width       = 65,  # width of R output
    prompt      = " ", # Sign preceding R input in R-GUI
    continue    = " "  # same, but after 2nd line
)   # 

# The working directory:
# setwd("C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg/soiltexture/inst/doc/INOUT") 

# And load the xtable package:
if( !"xtable" %in% .packages(all.available = TRUE) )
{   #
    message( paste( sep = "", 
        "The xtable package is not present in your R install:\n", 
        "R will now try to connect to one package server\n", 
        "and propose you a list of package to download\n", 
        "and install: Choose 'xtable' from the list"
    )   )   #
    utils:::menuInstallPkgs() 
}   #
require( "xtable" ) 


###################################################
### chunk number 2: 
###################################################
build.nr <- readLines( 
    con = file.path( getwd(), "build.txt" ), 
    n   = 1 
)   #
#
build.nr <- as.numeric( build.nr )[1] + 1 


###################################################
### chunk number 3: 
###################################################
build.nr <- writeLines( 
    con     = file.path( getwd(), "build.txt" ), 
    text    = as.character( build.nr )  
)   #
#
rm( build.nr ) 


###################################################
### chunk number 4: COVERFIG
###################################################
old.wd  <- getwd() 

# setwd("C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg/soiltexture/inst/doc/INOUT") 

if( !("soiltexture" %in%  as.character( installed.packages()[,1] )) ) 
{   #
    suppressMessages( 
        install.packages( 
            pkgs  = "soiltexture", 
            repos = "http://R-Forge.R-project.org" 
        )   #
    )   #
}   #

require( package = "soiltexture", character.only = TRUE ) 

# setwd(old.wd) 

TT.plot(class.p.bg.col=T,class.sys="USDA.TT",main=NA)


###################################################
### chunk number 5: 
###################################################
bornes <- c(0,2,20,50,200,2e3,20e3)
noms   <- c("Cl","FiSi","CoSi","FiSa","CoSa","Gr","St")
txt.b  <- c("0µm","2µm","20µm","50µm","200µm","2mm","2cm")

tmp <- data.frame(bornes,noms,txt.b)
tmp$"txt.b" <- as.character(tmp$"txt.b")

par(  "mar"=c(4,1,1,1)+0.1  )  #  c(bottom, left, top, right)

plot( 
	x		= tmp$"bornes"[-1],  
	y		= rep(1,dim(tmp[-1,])[1]),  
	type	= "n",  
	main	= "",  
	xlab	= "Soil particule sizes",  
	ylab	= "",  
	yaxt	= "n",  xaxt = "n",  
	log		= "x",  
	xlim	= c(0.2,75e3), 
	bty		= "n", 
	cex.lab = 2  
)	#

abline(v=tmp$"bornes",lty=3,lwd=c(2,4,2,4,2,4,2))
abline(h=par("usr")[3:4],lty=1,lwd=4)

mtext( 
    text    = tmp$"txt.b"[-1], 
    side    = 1, 
    line    = rep( 
        c(0.5,1.25), 
        (dim(tmp)[1]-1)/2
    ),  #
    at  = tmp$"bornes"[-1], 
    cex = 2  
)   #

xtxt <- (tmp$"bornes"[1:(length(tmp$"bornes"))]+c(tmp$"bornes"[2:length(tmp$"bornes")],75e3))/2

text(x=xtxt,y=rep(1,length(xtxt)),labels=tmp$"noms",cex=2) 


###################################################
### chunk number 6: 
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = data.frame( 
        "CLAY"  = 45, 
        "SILT"  = 38, 
        "SAND"  = 17 
    ),  #
    main        = NA  
)   #


###################################################
### chunk number 7: 
###################################################
TT.plot( 
    class.sys   = "FAO50.TT", 
    tri.data    = data.frame( 
        "CLAY"  = 45, 
        "SILT"  = 38, 
        "SAND"  = 17 
    ),  #
    main        = NA  
)   #


###################################################
### chunk number 8: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "FAO50.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the FAO system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 9:  eval=FALSE
###################################################
## detach( package:soiltexture ) 
## remove.packages( "soiltexture" ) 


###################################################
### chunk number 10:  eval=FALSE
###################################################
## install.packages( 
##     pkgs  = "soiltexture", 
##     repos = "http://R-Forge.R-project.org" 
## )   #


###################################################
### chunk number 11: 
###################################################
require( soiltexture ) 


###################################################
### chunk number 12:  eval=FALSE
###################################################
## detach( package:soiltexture ) 
## remove.packages( "soiltexture" ) 


###################################################
### chunk number 13:  eval=FALSE
###################################################
## download.file( 
##     url = 
## "http://r-forge.r-project.org/bin/windows/contrib/2.10/soiltexture_1.0.zip", 
##     destfile = file.path( getwd(), "soiltexture_1.0.zip" ) 
## )   #
## #
## install.packages( 
##     pkgs  = file.path( getwd(), "soiltexture_1.0.zip" ), 
##     repos = NULL 
## )   #
## #
## file.remove( "soiltexture_1.0.zip" ) 


###################################################
### chunk number 14: 
###################################################
source( 
    paste( 
        sep = "", 
        "http://r-forge.r-project.org/plugins/scmsvn/viewcvs.php", 
        "/*checkout*/pkg/soiltexture/R", 
        "/soiltexture.r?root=soiltexture" 
    )   #
)   #


###################################################
### chunk number 15: 
###################################################
# setwd("C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg/soiltexture/inst/doc/INOUT") 


###################################################
### chunk number 16: 
###################################################
TT.plot( class.sys = "none" ) 


###################################################
### chunk number 17: 
###################################################
TT.plot( class.sys = "USDA.TT" ) 


###################################################
### chunk number 18: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "USDA.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the USDA system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 19: 
###################################################
TT.plot( class.sys = "FAO50.TT" ) 


###################################################
### chunk number 20: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "FAO50.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the FAO system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 21: 
###################################################
TT.plot( class.sys = "FR.AISNE.TT" ) 


###################################################
### chunk number 22: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "FR.AISNE.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the French 'Aisne' system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 23: 
###################################################
TT.plot( class.sys = "FR.GEPPA.TT" ) 


###################################################
### chunk number 24: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "FR.GEPPA.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the French 'GEPPA' system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 25: 
###################################################
TT.plot( class.sys = "DE.BK94.TT" ) 


###################################################
### chunk number 26: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "DE.BK94.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the German system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 27: 
###################################################
TT.plot( class.sys = "UK.SSEW.TT" ) 


###################################################
### chunk number 28: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "UK.SSEW.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the UK system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 29: 
###################################################
TT.plot( class.sys = "AU.TT" ) 


###################################################
### chunk number 30: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "AU.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Australian system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 31: 
###################################################
TT.plot( class.sys = "BE.TT" ) 


###################################################
### chunk number 32: 
###################################################
tex.tbl <- TT.classes.tbl( class.sys = "BE.TT" ) 
xtable( 
    x       = tex.tbl[,-3],  #
    caption = "Texture classes of the Belgian system / triangle", 
    label   = NULL  
)   #


###################################################
### chunk number 33: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "USDA.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "FAO50.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 34: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "FR.AISNE.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "FR.GEPPA.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 35: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "UK.SSEW.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "DE.BK94.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 36: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles
TT.plot( 
    class.sys       = "AU.TT", 
    class.p.bg.col  = TRUE
)   #

TT.plot( 
    class.sys       = "BE.TT", 
    class.p.bg.col  = TRUE
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 37: 
###################################################
# First plot the USDA texture triangle, and retrieve its 
#   geometrical features, silently outputted by TT.plot 
geo <- TT.plot( 
    class.sys   = "USDA.TT", 
    main        = "USDA and French Aisne triangles, overplotted"  
)   # 

# Then overplot the French Aisne texture triangle, 
#   and customise the colors so triangles are well distinct.
TT.classes(
    geo             = geo, 
    class.sys       = "FR.AISNE.TT", 
    # Additional "graphical" options
    class.line.col  = "red", 
    class.lab.col   = "red", 
    lwd.axis        = 2  
)   #


###################################################
### chunk number 38: 
###################################################
# First plot the USDA texture triangle, and retrieve its 
#   geometrical features, silently outputted by TT.plot 
geo <- TT.plot( 
    class.sys   = "FR.AISNE.TT", 
    main        = "French Aisne and GEPPA triangles, overplotted"  
)   # 

# Then overplot the French Aisne texture triangle, 
#   and customise the colors so triangles are well distinct.
TT.classes(
    geo             = geo, 
    class.sys       = "FR.GEPPA.TT", 
    # Additional "graphical" options
    class.line.col  = "red", 
    class.lab.col   = "red", 
    lwd.axis        = 2  
)   #


###################################################
### chunk number 39: 
###################################################
# Create a dummy data frame of soil textures:
my.text <- data.frame( 
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47), 
    "SILT"  = c(05,08,15,25,55,85,65,45,15,15,17,43), 
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10), 
    "OC"    = c(20,14,15,05,12,15,07,21,25,30,05,28)  
)   #

# Display the table:
my.text


###################################################
### chunk number 40: 
###################################################
TT.plot( 
    class.sys   = "FAO50.TT", 
    tri.data    = my.text, 
    main        = "Soil texture data" 
)   #


###################################################
### chunk number 41: 
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = my.text, 
    z.name      = "OC", 
    main        = "Soil texture triangle and OC bubble plot" 
)   #


###################################################
### chunk number 42: 
###################################################
rand.text	<- TT.dataset(n=100,seed.val=1980042401)


###################################################
### chunk number 43: 
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = rand.text, 
    z.name      = "Z", 
    main        = "Soil texture triangle and Z bubble plot" 
)   #


###################################################
### chunk number 44: 
###################################################
TT.plot( 
    class.sys   = "none", 
    tri.data    = my.text, 
    z.name      = "OC", 
    main        = "Soil texture triangle and OC bubble plot" 
)   #

# Recompute some internal values:
z.cex.range <- TT.get("z.cex.range") 
def.pch     <- par("pch") 
def.col     <- par("col")
def.cex     <- TT.get("cex") 
oc.str      <- TT.str( 
    my.text[,"OC"], 
    z.cex.range[1], 
    z.cex.range[2]
)   #

# The legend:
legend( 
    x           = 80, 
    y           = 90, 
    title       = 
        expression( bold('OC [g.kg'^-1 ~ ']') ), 
    legend      = formatC( 
        c( 
            min( my.text[,"OC"] ), 
            quantile(my.text[,"OC"] ,probs=c(25,50,75)/100), 
            max( my.text[,"OC"] ) 
        ), 
        format  = "f", 
        digits  = 1, 
        width   = 4, 
        flag    = "0" 
    ),  #
    pt.lwd      = 4, 
    col         = def.col, 
    pt.cex      = c( 
            min( oc.str ), 
            quantile(oc.str ,probs=c(25,50,75)/100), 
            max( oc.str ) 
    ),  #, 
    pch         = def.pch, 
    bty         = "o", 
    bg          = NA, 
    box.col     = NA, 
    text.col    = "black", 
    cex         = def.cex  
)   #


###################################################
### chunk number 45: 
###################################################
geo <- TT.geo.get() 
#
iwd.res <- TT.iwd( 
    geo         = geo, 
    tri.data    = rand.text, 
    z.name      = "Z", 
)   #
#
TT.image( 
    x       = iwd.res, 
    geo     = geo, 
    main    = "Soil texture triangle and Z heatmap" 
)   # 
#
TT.plot( 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE  #  <<-- important 
)   #


###################################################
### chunk number 46: 
###################################################
TT.image( 
    x       = iwd.res, 
    geo     = geo, 
    main    = "Soil texture triangle and Z heatmap" 
)   # 
#
TT.contour( 
    x       = iwd.res, 
    geo     = geo, 
    add     = TRUE, #  <<-- important
    lwd     = 2  
)   # 
#
TT.plot( 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE  #  <<-- important
)   #


###################################################
### chunk number 47: 
###################################################
geo <- TT.geo.get()  
#
kde.res <- TT.kde2d( 
    geo         = geo, 
    tri.data    = rand.text  
)   #
#
TT.contour( 
    x       = kde.res, 
    geo     = geo, 
    main    = "Probability density estimate of the texture data", 
    lwd     = 2, 
    col     = "red"  
)   # 
#
TT.plot( 
    tri.data    = rand.text, 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE, #  <<-- important 
    col         = "gray"
)   #


###################################################
### chunk number 48: 
###################################################
geo <- TT.geo.get() 
#
maha <- TT.mahalanobis( 
    geo         = geo, 
    tri.data    = rand.text  
)   #
#
TT.contour( 
    x       = maha, 
    geo     = geo, 
    main    = "Texture data Mahalanobis distance", 
    lwd     = 2, 
    col     = "blue"  
)   # 
#
TT.plot( 
    tri.data    = rand.text, 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE, #  <<-- important 
    col         = "gray"
)   #


###################################################
### chunk number 49: 
###################################################
geo <- TT.geo.get() 
#
maha <- TT.mahalanobis( 
    geo         = geo, 
    tri.data    = rand.text, 
    alr         = TRUE  #  <<-- important 
)   #
#
TT.contour( 
    x       = maha, 
    geo     = geo, 
    main    = "Texture data Mahalanobis distance", 
    lwd     = 2, 
    col     = "blue", 
    levels  = c(0.5,1,2,4,8)  #  <<-- manually set. Otherwise 
)   #                                 ugly plot
#
TT.plot( 
    tri.data    = rand.text, 
    geo         = geo, 
    grid.show   = FALSE, 
    add         = TRUE,  #  <<-- important 
    col         = "gray"
)   #


###################################################
### chunk number 50: 
###################################################
# Display the USDA texture triangle:
geo     <- TT.plot(class.sys="USDA.TT") 

# Create some custom labels:
labelz  <- letters[1:dim(my.text)[1]] 
labelz 

# Display the text
TT.text( 
    tri.data    = my.text, 
    geo         = geo, 
    labels      = labelz, 
    font        = 2, 
    col         = "blue"  
)   #


###################################################
### chunk number 51: 
###################################################
TT.data.test( tri.data = rand.text ) 


###################################################
### chunk number 52: 
###################################################
res <- TT.normalise.sum( tri.data = rand.text ) 
#
# With output of the residuals:
res <- TT.normalise.sum( 
    tri.data    = rand.text, 
    residuals   = TRUE  #  <<-- default = FALSE 
)   #
#
colnames( rand.text )
colnames( res )  #  "Z" has been dropped
max( res[ , "residuals" ] ) 


###################################################
### chunk number 53: 
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT"  
)   #


###################################################
### chunk number 54: 
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "USDA.TT"  
)   #


###################################################
### chunk number 55: 
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT", 
    PiC.type    = "l" 
)   #


###################################################
### chunk number 56: 
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT", 
    PiC.type    = "t" 
)   #


###################################################
### chunk number 57: 
###################################################
TT.points.in.classes( 
    tri.data    = my.text[1:5,], 
    class.sys   = "FAO50.TT", 
    PiC.type    = "t", 
    collapse    = ";"
)   #


###################################################
### chunk number 58: 
###################################################
tmp.cex <- 1.5
old.par <- par(no.readonly = TRUE)
par(cex=tmp.cex,cex.axis=tmp.cex,cex.lab=tmp.cex,cex.main=tmp.cex)

tmp.text <- data.frame( "CLAY" = 20, "SILT" = 15, "SAND" = 65 ) 

plot( 
    x       = dia2phi( c(2,20,2000) ), 
    y       = cumsum( unlist(tmp.text[1,]) ), 
    ylim    = c(0,100), 
    xlim    = dia2phi( c(1,2000) ), 
    xaxt    = "n", 
    xlab    =  
expression( 'Particle size['~ mu * 'm] (log'[2] * 'scale)' ), 
    ylab    = "Cumulated particle size distribution [%]", 
    bty     = "n", 
    type    = "b", 
    main    = 
"Principle of particle size log-linear transformation", 
    cex     = tmp.cex  
)   #

lines( 
    spline( 
        y   = rev(cumsum( unlist(tmp.text[1,]) )), 
        x   = dia2phi( c(2000,20,2))
    ),  # 
    col = "green"  
)   #

segments( 
    x0  = dia2phi( c(2,20,2000) ), 
    x1  = dia2phi( c(2,20,2000) ), 
    y0  = rep(0,3), 
    y1  = cumsum( unlist(tmp.text[1,]) ), 
    col = "red"  
)   #

new.tmp.text <- TT.text.transf( 
    tri.data        = tmp.text,  
    base.css.ps.lim = c(0,2,50,2000),  
    dat.css.ps.lim  = c(0,2,20,2000)   
)   #

new.silt.c <- cumsum( unlist(new.tmp.text[1,]) )[2]

arrows( 
    x0  = dia2phi( c(50,50) ), 
    x1  = dia2phi( c(50,1) ), 
    y0  = c(0,new.silt.c), 
    y1  = c(new.silt.c,new.silt.c), 
    col = "blue"  
)   #

text( 
    x       = dia2phi( c(2,20,2000) ), 
    y       = cumsum( unlist(tmp.text[1,]) ), 
    pos     = 2, 
    offset  = 1, 
    labels  = c("Clay","Silt","Sand"), 
    col     = "red", 
    cex     = tmp.cex  
)   #

text( 
    x       = dia2phi( c(50) ), 
    y       = new.silt.c, 
    pos     = 4, 
    offset  = 1, 
    labels  = "new Silt", 
    col     = "blue", 
    cex     = tmp.cex  
)   #

axis( 
    side    = 1, 
    at      = dia2phi( c(2,20,50,2000) ), 
    labels  = c(2,20,50,2000) 
)   #

text( 
    x       = dia2phi( 500 ), 
    y       = 65, 
    #pos    = 4, 
    #offset = 1, 
    labels  = "real distribution?", 
    col     = "green", 
    cex     = tmp.cex  
)   #

par(old.par) 


###################################################
### chunk number 59: 
###################################################
my.text[1:5,]   


###################################################
### chunk number 60: 
###################################################
TT.text.transf( 
	tri.data        = my.text[1:5,],  
	base.css.ps.lim = c(0,2,50,2000),  
	dat.css.ps.lim  = c(0,2,63,2000)   
)   #


###################################################
### chunk number 61: 
###################################################
# Copy the data.frame
my.text.fr  <- my.text 
# Curent columns names:
colnames(my.text.fr) 
# New columns names: 
colnames(my.text.fr) <- c("ARGILE","LIMON","SABLE","CO") 


###################################################
### chunk number 62: 
###################################################
TT.text.transf( 
    tri.data        = my.text.fr[1:5,],  
    base.css.ps.lim = c(0,2,50,2000),  
    dat.css.ps.lim  = c(0,2,63,2000),  
    css.names       = c("ARGILE","LIMON","SABLE")   
)   #


###################################################
### chunk number 63: 
###################################################
# Create a random fraction between 0 and 1
r.frac <- runif(n=dim(my.text)[1]) 
#
my.text4 <- cbind( 
    "CLAY"          = my.text[,"CLAY"], 
    "FINE_SILT"     = my.text[,"SILT"] * r.frac, 
    "COARSE_SILT"   = my.text[,"SILT"] * (1-r.frac), 
    "SAND"          = my.text[,"SAND"]  
)   #
#
my.text4[1:5,] 


###################################################
### chunk number 64: 
###################################################
TT.text.transf.X( 
    tri.data        = my.text4[1:5,], 
    base.ps.lim = c(0,2,20,50,2000),  
    dat.ps.lim  = c(0,2,20,63,2000)   
)   #


###################################################
### chunk number 65: 
###################################################
TT.text.transf.X( 
    tri.data        = my.text4[1:5,], 
    base.ps.lim = c(0,2,50,2000),  
    dat.ps.lim  = c(0,2,20,63,2000)   
)   #


###################################################
### chunk number 66: 
###################################################
# First, plot the data without transformation:
geo <- TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    tri.data    = my.text, 
    col         = "red", 
    main        = "Transformed and untransformed data"
)   #

# Then, re-plot them with transformation:
TT.points( 
    tri.data        = my.text, 
    geo             = geo, 
    dat.css.ps.lim  = c(0,2,63,2000),  
    css.transf      = TRUE, 
    col             = "blue", 
    pch             = 3  
)   #


###################################################
### chunk number 67: 
###################################################
# Not transformed
geo <- TT.plot( 
    class.sys   = "UK.SSEW.TT", 
    base.css.ps.lim = c(0,2,50,2000), 
    main        = 
        "Dummy transformation of the UK texture triangle"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "UK.SSEW.TT", 
    css.transf      = TRUE, 
    # Additional "graphical" options
    class.line.col  = "red", 
    class.lab.col   = "red", 
    lwd.axis        = 2, 
    class.lab.show  = "none", 
    class.lty       = 2 
)   #


###################################################
### chunk number 68: 
###################################################
# No transformation needed or stated
geo <- TT.plot( 
    class.sys   = "USDA.TT", 
    main        = 
        "USDA and transformed UK triangle, overplotted"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "UK.SSEW.TT", 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### chunk number 69: 
###################################################
# Untransformed
geo <- TT.plot( 
    class.sys   = "USDA.TT", 
    main        = 
        "(Dummy) transformation of the USDA texture triangle"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "USDA.TT", 
    tri.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### chunk number 70: 
###################################################
geo <- TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    blr.tx      = c("SAND","CLAY","SILT"), 
    main        = 
        "(Dummy) transformation of the GEPPA texture triangle"  
)   # 

TT.classes(
    geo             = geo, 
    class.sys       = "FR.GEPPA.TT", 
    tri.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### chunk number 71: 
###################################################
# Not transformed
geo <- TT.plot( 
    class.sys       = "FR.GEPPA.TT", 
    blr.tx          = c("SAND","CLAY","SILT"), 
    base.css.ps.lim  = c(0,2,20,2000), 
    main        = 
        "(Dummy) transformation of the GEPPA texture triangle"  
)   # 

# Transformed
TT.classes(
    geo             = geo, 
    class.sys       = "FR.GEPPA.TT", 
    css.transf      = TRUE,  #  <<-- important
    # Additional "graphical" options
    class.line.col  = "blue", 
    class.lab.col   = "blue", 
    lwd.axis        = 2, 
    class.lty       = 2 
)   #


###################################################
### chunk number 72: 
###################################################
TT.points.in.classes( 
    tri.data        = my.text[1:5,], 
    class.sys       = "USDA.TT", 
    dat.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE   #  <<-- important
)   #


###################################################
### chunk number 73: 
###################################################
TT.plot( 
    class.sys       = "USDA.TT", 
    tri.data        = my.text, 
    dat.css.ps.lim  = c(0,2,20,2000), 
    css.transf      = TRUE,  #  <<-- important
    col             = "red"  
)   # 


###################################################
### chunk number 74: 
###################################################
TT.points.in.classes( 
    tri.data        = my.text[1:5,], 
    class.sys       = "USDA.TT", 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE  
)   #


###################################################
### chunk number 75: 
###################################################
TT.plot( 
    class.sys       = "USDA.TT", 
    tri.data        = my.text, 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE, 
    col             = "red"  
)   # 


###################################################
### chunk number 76: 
###################################################
# Create a new function, in fact the copy of TT.text.transf()
TT.text.transf2 <- TT.text.transf

# Imagine some changes in TT.text.transf2...

# Use your new function (will give identical results)
TT.points.in.classes( 
    tri.data        = my.text[1:5,], 
    class.sys       = "USDA.TT", 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE, 
    text.transf.fun = "TT.text.transf2"  #  <<-- important
)   #


###################################################
### chunk number 77: 
###################################################
TT.plot( 
    class.sys       = "USDA.TT", 
    tri.data        = my.text, 
    dat.css.ps.lim  = c(0,2,20,2000), 
    base.css.ps.lim = c(0,2,20,2000), 
    css.transf      = TRUE, 
    col             = "red", 
    text.transf.fun = "TT.text.transf2", #  <<-- important
    main            = 
        "Test of a (dummy) new transformation function"
)   # 


###################################################
### chunk number 78: 
###################################################
TT.plot( 
    class.sys   = "USDA.TT", 
    tlr.an      = c(45,90,45), 
    main        = "Re-projected USDA triangle (angles)"  
)   # 


###################################################
### chunk number 79: 
###################################################
TT.plot( 
    class.sys   = "FR.AISNE.TT", 
    blr.tx      = c("CLAY","SILT","SAND"), 
    main        = "Re-projected French Aisne triangle (axis)"  
)   # 


###################################################
### chunk number 80: 
###################################################
TT.plot( 
    class.sys   = "FAO50.TT", 
    blr.clock   = c(FALSE,TRUE,NA), 
    main        = "Re-projected FAO triangle (axis directions)"  
)   # 


###################################################
### chunk number 81: 
###################################################
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    tlr.an      = c(60,60,60), 
    blr.tx      = c("SAND","CLAY","SILT"), 
    blr.clock   = c(TRUE,TRUE,TRUE), 
    main        = "Fully re-projected GEPPA triangle"  
)   # 


###################################################
### chunk number 82: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different geometries:
TT.plot( class.sys = "USDA.TT" ) 

TT.plot( 
    class.sys   = "USDA.TT", 
    blr.tx      = c("SILT","SAND","CLAY"), 
    blr.clock   = c(FALSE,FALSE,FALSE), 
    main        = "USDA triangle with a different geometry"  
)   # 

# Back to old parameters:
par(old.par)


###################################################
### chunk number 83: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "fr" 
)   #

TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "de" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 84: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "es" 
)   #

TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "it" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 85: 
###################################################
# Set a 2 by 2 plot matrix:
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "nl" 
)   #

TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "fl" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 86: 
###################################################
# Set a 2 by 2 plot matrix (for size):
old.par <- par(no.readonly=T)
par("mfcol" = c(1,2),"mfrow"=c(1,2)) 

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "se" 
)   #

# Plot the triangles with different languages:
TT.plot( 
    class.sys   = "FR.GEPPA.TT", 
    lang        = "en" 
)   #

# Back to old parameters:
par(old.par)


###################################################
### chunk number 87: 
###################################################
TT.plot( 
    tri.data    = my.text.fr, 
    class.sys   = "FAO50.TT", 
    css.names   = c("ARGILE","LIMON","SABLE") 
)   #


###################################################
### chunk number 88: 
###################################################
TT.plot( 
    tri.data    = my.text.fr, 
    class.sys   = "FAO50.TT", 
    css.names   = c("ARGILE","LIMON","SABLE"), 
    css.lab     = c("l'argile [%]","Le limon [%]","Le sable [%]"), 
    main        = 
        "A texture triangle with (dummy) custom axis names"  
)   #


###################################################
### chunk number 89: 
###################################################
TT.plot( 
    tri.data    = my.text.fr, 
    class.sys   = "FAO50.TT", 
    css.names   = c("ARGILE","LIMON","SABLE"), 
    css.lab     = expression( 
        bold(sqrt('Argile'^2)~'[%]'), 
        bold(sqrt('Limon'^2)~'[%]'), 
        bold(sqrt('Sable'^2)~'[%]')
    ),  #
    main        = 
        "A texture triangle with (dummy) custom axis names"  
)   #


###################################################
### chunk number 90: 
###################################################
# Fisrt, retrieve all the data about 
#   the USDA texture triangle
tmp <- TT.get("USDA.TT") 

# It is not displayed here because it is to big
#   The list names are:
names(tmp) 

# If we drop "tt.points" and "tt.polygons", that will be 
#   presented later, the list size is more reasonable
tmp[ !names(tmp) %in% c("tt.points","tt.polygons") ]


###################################################
### chunk number 91: 
###################################################
# Retrieve and save the table:
tmp2 <- TT.classes.tbl( class.sys = "FAO50.TT" ) 

# Display the first part:
tmp2[,1:2] 

# Then display the last column (and the 1st again):
tmp2[,c(1,3)] 


###################################################
### chunk number 92: 
###################################################
TT.vertices.tbl( class.sys = "FAO50.TT" ) 


###################################################
### chunk number 93: 
###################################################
geo <- TT.plot( 
    class.sys   = "FAO50.TT", 
    main        = "Vertices numbers. USDA texture triangle"
)   # 

TT.vertices.plot( 
    geo         = geo, 
    class.sys   = "FAO50.TT", 
    col         = "red", 
    cex         = 2, 
    font        = 2  
)   #


###################################################
### chunk number 94: 
###################################################
# Step 1 
FAO63 <- TT.get("FAO50.TT") 
#
# Visualize the data that will be modified
FAO63[[ "base.css.ps.lim" ]] 
FAO63[[ "tri.css.ps.lim" ]] 
#
# Step 2 
FAO63[[ "base.css.ps.lim" ]][3] <- 63 
FAO63[[ "tri.css.ps.lim" ]][3]  <- 63 
#
# Step 3: Load the new texture triangle
TT.add( "FAO63.TT" = FAO63 ) 


###################################################
### chunk number 95: 
###################################################
TT.plot( 
    class.sys   = "FAO63.TT", 
    main        = "Modified FAO soil texture triangle"
)   # 


###################################################
### chunk number 96: 
###################################################
# Get the definition of the FAO50 texture triangle
FAO50 <- TT.get( "FAO50.TT" ) 
#
# Check its class (list) 
class( FAO50 ) 
#
# Check its parameters names 
names( FAO50 ) 
#
# Check its parameters class 
for( i in 1:length(FAO50) )
{   #
    print( 
        paste( 
            names( FAO50 )[i], 
            class( FAO50[[i]] ), 
            sep = ": "
        )   #
    )   # 
}   #


