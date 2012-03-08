rm(list=ls(all=TRUE)) 
pkg.dir      <- "C:/_R_PACKAGES/soiltexture/pkg" 
# pkg.dir      <- "/home/jules/_WORK/R_PACKAGES/soiltexture/pkg" 
pkg.name     <- "soiltexture" 
pkg.version  <- "1.2.9" 
pkg.depends  <- c("sp","MASS") 
pkg.suggests <- c("drc","plotrix","xtable") 
RVersion     <- "R (>= 2.4.1)" 
# r.path       <- "C:/Program Files/_SCIENCE/R_PROJECT_2-4-1/bin" 
r.path       <- ""  #  Use curent R version




require( "rcmdwrapper" ) # See rcmdwrapper_1.1.zip



# Change the description file:
pkg.description( 
    pkg.name     = pkg.name, 
    pkg.dir      = pkg.dir, 
    pkg.version  = pkg.version, 
    pkg.depends  = pkg.depends, 
    pkg.suggests = pkg.suggests, 
    RVersion     = RVersion  
)   #



# Create the package skeleton with inlinedocs
package.skeleton.dx( 
    pkgdir    = file.path( pkg.dir, pkg.name ), 
    namespace = TRUE  
)   #

# file.copy(
#     from      = file.path( pkg.dir, pkg.name, "inst", "doc", "TT.env.Rd" ), 
#     to        = file.path( pkg.dir, pkg.name, "man", "TT.env.Rd" ), 
#     overwrite = TRUE  
# )   #

file.copy(
    from      = file.path( pkg.dir, "..", "prepare", "TT.env.Rd" ), 
    to        = file.path( pkg.dir, pkg.name, "man", "TT.env.Rd" ), 
    overwrite = TRUE  
)   #

pkg.remove.wrapper( pkg.name = pkg.name ) 

