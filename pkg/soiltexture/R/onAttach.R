.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  #
    cat( "'", pkgname, "' loaded.\n" ) 
    #
    # Setup the polish triangle and language setting
    if( !(tolower(Sys.info()["sysname"]) %in% c("mac","darwin")) )
    {   #
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
    }else{ 
        cat( "\tPolish diagram and language are not default loaded for Macs,\n" ) 
        cat( "\ttype source( system.file( 'polish_triangle.r', package = pkgname ), encoding = 'UTF-8' )\n" ) 
        cat( "\tand source( system.file( 'polish_language.r', package = pkgname ), encoding = 'UTF-8' )\n" ) 
        cat( "\tto load them (if it works)" ) 
    }   #
    #
}   #

