.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    # Setup the polish triangle and language setting
    source( system.file( "polish_triangle.r", package = pkgname ), encoding = "UTF-8" ) 
    source( system.file( "polish_language.r", package = pkgname ), encoding = "UTF-8" ) 
    #
    lang.par <- TT.get( "lang.par" ) 
    lang.par <- rbind( 
        lang.par, 
        lang.par2 
    )   #
    #
    # rm( lang.par2 ) 
    #
    TT.set( "lang.par" = lang.par ) 
    #
    cat( "'", pkgname, "' has been loaded.\n" ) 
}   #

