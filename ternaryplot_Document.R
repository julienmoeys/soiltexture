rm(list=ls(all=TRUE)) 
pkgName     <- "ternaryplot"
pkgDir      <- "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages/ternaryplot/pkg"


library( "inlinedocs" )


# Source some utility functions
source( file.path( pkgDir, "..","packageUtilities.R" ) ) 


# Change the description file:
pkgDescription( 
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "0.1.1", 
    pkgDepends  = "methods", 
    pkgSuggests = NULL, 
    RVersion    = NULL   
)   



roxygenize( 
    package.dir   = file.path( pkgDir, pkgName ), 
    unlink.target = TRUE, 
    roclets       = c( "namespace", "rd" ) # "collate" 
)   


pkgRemove( pkgName = pkgName ) 
