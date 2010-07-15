setwd("C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/soiltexture_foodweb")

require(soiltexture)

require(mvbutils) 

# foodweb( 
#     where   = "package:MACROLegions", 
#     cex     = 1, 
#     charlim = 60
# )   #



funz <- c(
    "TT.plot", 
    "TT.points.in.classes", 
    "TT.classes", 
    "TT.iwd", 
    "TT.image", 
    "TT.contour", 
    "TT.kde2d", 
    "TT.mahalanobis", 
    "TT.text", 
    "TT.normalise.sum", 
    "TT.text.transf", 
    "TT.text.transf.X", 
    "TT.points", 
    "TT.classes.tbl", 
    "TT.vertices.tbl", 
    "TT.vertices.plot"  
)   #



for( i in funz )
{   #
    pdf(
        file        = paste(sep="",i,".pdf"), 
        width       = 21/2.51, 
        height      = 21/2.51, 
        pointsize   = 14  
    )   #
    #
    foodweb( 
        prune       = i, 
        where       = "package:soiltexture", 
        cex         = 1, 
        charlim     = 60, 
        ancestors   = FALSE, 
        descendents = TRUE 
    )   #
    #
    dev.off() 
}   #
