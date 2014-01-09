
rm(list=ls(all=TRUE)) 

pkgName     <- "soiltexturetransformation"
pkgDir      <- file.path( "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages", 
    "soiltexture", "pkg" ) 


library( "inlinedocs" )


# Source some utility functions
source( file.path( pkgDir, "..", "packageUtilities.R" ) ) 


# Change the description file:
pkgDescription( 
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "1.0.0", 
    pkgDepends  = c("soiltexture","drc"), # "plotrix",
    pkgSuggests = NULL,  # "xtable"
    RVersion    = NULL   
)   



package.skeleton.dx( 
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = TRUE  
)   #


pkgRemove( pkgName = pkgName ) 


