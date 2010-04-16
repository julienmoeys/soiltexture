rm(list=ls(all=TRUE)) 
wrapper.path <- "C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/R_CMD_wrapper.R"
pkg.dir      <- "C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg" 
pkg.name     <- "soiltexture" 
code.files   <- "soiltexture.r" 
pkg.version  <- "1.0" 
pkg.depends  <- c("sp","MASS") 



source( wrapper.path )  



package.skeleton.dx( 
    pkgdir     = file.path( pkg.dir, pkg.name ), 
    code_files = code.files 
    # code_files = file.path( pkg.dir, pkg.name, "R", code.files ) 
)   #



pkg.remove.wrapper( pkg.name = pkg.name ) 



# Change the description file:
pkg.description( pkg.name = pkg.name, pkg.dir = pkg.dir, 
                 pkg.version = pkg.version, pkg.depends = pkg.depends ) 



# Build the package
pkg.build.wrapper( pkg.name = pkg.name, pkg.dir = pkg.dir ) 



# Install the package:
pkg.install.wrapper( pkg.name = pkg.name, pkg.dir = pkg.dir ) 



# Check the package
date() 
pkg.check.wrapper( pkg.name = pkg.name, pkg.dir = pkg.dir ) 
date() 



# Re-install and load the package from the new zip archive:
install.packages.zip( pkg.name = pkg.name, pkg.dir = pkg.dir, pkg.version = pkg.version ) 
require( package = pkg.name, character.only = TRUE ) 

