
.onAttach <- function(# Internal. Message displayed when loading the package.
 libname, 
 pkgname  
){  
    #cat( "'", pkgname, "' loaded.\n" ) 
    
    # Setup the polish triangle and language setting
    ## if( !(tolower(Sys.info()["sysname"]) %in% c("mac","darwin")) ) 
    
    
    #   Try to load triangles and languages with special characters
    tryRes <- try( lang.par2 <- readRDS( file = system.file( 
        "languages.rds", package = pkgname ) ) ) 

    tryRes2 <- try( triPar2 <- readRDS( file = system.file( 
        "triangles.rds", package = pkgname ) ) )
    
    
    # if( tolower(Sys.info()["sysname"]) %in% c("windows") ){ # "linux",
        # try( source( system.file( "polish_triangle.r", 
            # package = pkgname ), encoding = "UTF-8" ) )
        # tryRes <- try( source( system.file( "polish_language.r", 
            # package = pkgname ), encoding = "UTF-8" ) ) 
        
    # }else{ 
        # try( source( system.file( "polish_triangle_ANSI.r", 
            # package = pkgname ) ) )
        # tryRes <- try( source( system.file( "polish_language_ANSI.r", 
            # package = pkgname ) ) ) 
    # }   
    
    
    #   Extend language parameter if the polish triangle was loaded
    #   successfully
    if( !("try-error" %in% c( class( tryRes ), class( tryRes2 ) ) ) ){ 
        #   Save languages with special characters
        lang.par <- TT.get( "lang.par" ) 
        
        lang.par <- rbind( 
            lang.par, 
            lang.par2 
        )   
        
        TT.set( "lang.par" = lang.par ) 
        
        
        #   Save triangles with special characters
        for( i in 1:length( triPar2 ) ){ 
            do.call( what = "TT.add", args = triPar2[ i ] )
        }   
        
    }else{ 
        packageStartupMessage( "soiltexture: Languages and triangles with special characters could not be loaded" )
    }   
    
    
    # Welcome message
    if( interactive() ){ 
        msg <- sprintf( 
            "%s %s. For help type: help(pack='%s')", 
            pkgname, 
            as.character( packageVersion( pkgname ) ), 
            pkgname ) 
        
        packageStartupMessage( msg ) 
    }   
    
}   

