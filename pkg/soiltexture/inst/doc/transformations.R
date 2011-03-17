###################################################
### chunk number 1:  eval=FALSE
###################################################
## #line 41 "transformations.Rnw"
## install.packages("soiltexture") 


###################################################
### chunk number 2: 
###################################################
#line 48 "transformations.Rnw"
require( "soiltexture" ) 
require( "drc" )


###################################################
### chunk number 3: 
###################################################
#line 81 "transformations.Rnw"
my.text4 <- data.frame(
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47),
    "FSILT" = c(02,04,10,15,25,40,35,20,10,05,10,20),
    "CSILT" = c(03,04,05,10,30,45,30,25,05,10,07,23),
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10) 
)   #


###################################################
### chunk number 4: 
###################################################
#line 94 "transformations.Rnw"
res <- TT.text.transf.Xm(
    tri.data    = my.text4,
    base.ps.lim = c(0,1,50,2000),
    dat.ps.lim  = c(0,2,30,60,2000),
    psdmodel    ="AD"
)   #
#
round( res[,1:6], 3 ) 
#
round( res[,7:ncol(res)], 3 ) 


###################################################
### chunk number 5: 
###################################################
#line 138 "transformations.Rnw"
res <- TT.text.transf.Xm(
    tri.data    = my.text4,
    base.ps.lim = c(0,1,50,2000),
    dat.ps.lim  = c(0,2,30,60,2000),
    psdmodel    = "ML"
)   #
#
round( res[,1:6], 3 ) 
#
round( res[,7:ncol(res)], 3 ) 


###################################################
### chunk number 6: 
###################################################
#line 160 "transformations.Rnw"
res <- TT.text.transf.Xm(
    tri.data    = my.text4,
    base.ps.lim = c(0,1,50,2000),
    dat.ps.lim  = c(0,2,30,60,2000),
    psdmodel    = "ML",
    omethod     = "SANN"
)   #
#
round( res[,1:6], 3 ) 
#
round( res[,7:ncol(res)], 3 ) 


###################################################
### chunk number 7: 
###################################################
#line 188 "transformations.Rnw"
my.text5 <- data.frame(
    "CLAY"  = c(05,60,15,04.9,25,05,25,45,65,75,13,47),
    "FSILT" = c(02,04.3,10,15,25,40,35,20,10,05,10,20),
    "CSILT" = c(03,04,05,10,30,45,30,25,05,10,07.2,23.3),
    "SAND"  = c(90.5,32,70,70,20.3,10.9,9.3,9.4,20,10,70,10)
)   #
#
res <- TT.normalise.sum.X( 
    tri.data    = my.text5,
    residuals   = TRUE
)   #
#
res


