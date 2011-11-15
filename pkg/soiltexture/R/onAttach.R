.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    #cat( "'", pkgname, "' loaded.\n" ) 
    #
    # Setup the polish triangle and language setting
    ## if( !(tolower(Sys.info()["sysname"]) %in% c("mac","darwin")) ) 
    if( tolower(Sys.info()["sysname"]) %in% c("linux","windows") ) 
    {   #
        source( system.file( "polish_triangle.r", package = pkgname ), encoding = "UTF-8" ) 
        source( system.file( "polish_language.r", package = pkgname ), encoding = "UTF-8" ) 
    }else{ 
        source( system.file( "polish_triangle_ANSI.r", package = pkgname ) ) 
        source( system.file( "polish_language_ANSI.r", package = pkgname ) ) 
    }   #
    #
    lang.par <- TT.get( "lang.par" ) 
    lang.par <- rbind( 
        lang.par, 
        lang.par2 
    )   #
    #
    TT.set( "lang.par" = lang.par ) 
    #
    packageStartupMessage( 
        paste("'", pkgname, "' loaded.", sep = "" ) 
    )   #
}   #

