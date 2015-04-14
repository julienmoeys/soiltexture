
rm(list=ls(all=TRUE)) 

pkgName     <- "soiltexture"
pkgDir      <- file.path( "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages", 
    pkgName, "pkg" ) 


library( "inlinedocs" )


# Source some utility functions
source( file.path( pkgDir, "..", "packageUtilities.R" ) ) 


# Change the description file:
pkgDescription( 
    pkgName     = pkgName, 
    pkgDir      = pkgDir, 
    pkgVersion  = "1.3.0", 
    pkgDepends  = "utils", #  In Depends because can not importFrom Windows only functions 
    pkgSuggests = c( "xtable" ), # c("drc","plotrix"), 
    pkgImports  = c( "sp", "MASS", "tools", "tcltk" ), # "utils", 
    RVersion    = NULL   
)   



package.skeleton.dx( 
    pkgdir      = file.path( pkgDir, pkgName ), 
    namespace   = FALSE # Must be edited manually!  
)   


file.copy(
    from      = file.path( pkgDir, "..", "prepare", "TT.env.Rd" ), 
    to        = file.path( pkgDir, pkgName, "man", "TT.env.Rd" ), 
    overwrite = TRUE  
)   #


pkgRemove( pkgName = pkgName ) 


