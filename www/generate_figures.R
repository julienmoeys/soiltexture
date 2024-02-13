
setwd( "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages/soiltexture/www" )

library( "soiltexture" ) 

png(
    filename = "USDA_texture_triangle.png", 
    width    = 512, 
    height   = 512, 
    res      = 75 
)   

    TT.plot( class.sys = "USDA.TT", # family.op = "serif", 
        cex.axis = 1, cex.lab = 1, cex.main = 1, 
        class.p.bg.col = TRUE, main = NA ) 

dev.off() 
