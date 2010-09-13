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
