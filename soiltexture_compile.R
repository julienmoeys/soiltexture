rm(list=ls(all=TRUE)) 
pkg.dir      <- "C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg" 
pkg.name     <- "soiltexture" 
pkg.version  <- "1.03" 
pkg.depends  <- c("sp","MASS") 
pkg.suggests <- "drc" 
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

file.copy(
    from      = file.path( pkg.dir, pkg.name, "inst", "doc", "TT.env.Rd" ), 
    to        = file.path( pkg.dir, pkg.name, "man", "TT.env.Rd" ), 
    overwrite = TRUE  
)   #



pkg.remove.wrapper( pkg.name = pkg.name ) 


# # Build the package
# pkg.build.wrapper( 
#     pkg.name = pkg.name, 
#     pkg.dir  = pkg.dir, 
#     r.path   = r.path
# )   #



# # Install the package:
# pkg.install.wrapper( 
#     pkg.name = pkg.name, 
#     pkg.dir  = pkg.dir, 
#     r.path   = r.path
# )   #



# # Re-install and load the package from the new zip archive 
# # _before_ the tests are conducted
# install.packages.zip( 
#     pkg.name    = pkg.name, 
#     pkg.dir     = pkg.dir, 
#     pkg.version = pkg.version
# )   #



# # Check the package
# date() 
# pkg.check.wrapper( 
#     pkg.name = pkg.name, 
#     pkg.dir  = pkg.dir, 
#     r.cmd.op = "--no-tests", 
#     r.path   = r.path
# )   #
# date() 



# require( package = pkg.name, character.only = TRUE ) 

