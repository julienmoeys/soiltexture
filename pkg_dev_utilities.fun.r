


pdu_pkgRemove <- function(# Remove a package
### A wrapper for the function 'remove.packages()' that checks 
### if the package is installed before.

 pkgName
### Name of the package 

){  
    ip <- installed.packages() 
    
    if( pkgName %in%  rownames( ip ) ) 
    {   
        LibPath <- ip[ pkgName, "LibPath" ]
        
        remove.packages( pkgName, lib = LibPath )   
        
        print( 
            paste( 
                "Package", 
                pkgName, 
                "successfully / probably removed"  
            )   
        )   
    }else{ 
        print( 
            paste( 
                "Package", 
                pkgName, 
                "NOT removed because NOT installed"  
            )   
        )   
    }   
### Prints a message that state if the package has been removed 
### or if it has not been removed (because not installed).
}   #



pdu_pkgDescription <- function(# Modify a package's DESCRIPTION file
### Modify a package's DESCRIPTION file

 pkgName, 
### Name of the package, and of the package directory

 pkgDir, 
### Name of the directory in which the package directory is
### located 

 pkgVersion, 
### Single _character_ string. Version of the package, to be written 
### in the DESCRIPTION file

 RVersion=NULL,
### Single _character_ string. Minimum version of R on which the 
### package works (presumably). Use the style "R (>= 2.2.1)". 
### If set to NULL, the current R version will be used.

 pkgDepends=NULL, 
### Vector of character strings. Names of the packages that needs to be installed
### prior to the package installation. NULL if none

 pkgImports=NULL, 
### Vector of character string. Names of the packages that needs 
### to be cited in the "Imports" field. NULL if none

 pkgSuggests=NULL
### Vector of character string. Names of the packages that needs 
### to be cited in the "Suggests" field. NULL if none

){  
    # Read the file DESCRIPTION 
    desc <- utils::packageDescription(
        pkg     = pkgName, 
        lib.loc = pkgDir )  
    
    
    # Modify the date
    desc[[ "Date" ]] <- Sys.Date() 
    
    
    # Modify the version 
    desc[[ "Version" ]] <- pkgVersion 
    
    
    # Modify the dependencies
    if( is.null( RVersion ) )
    {   
        # Get R version:
        RVersion <- R.Version() 
        
        vMinor <- RVersion[["minor"]]
        vMinor <- strsplit( x = vMinor, split = ".", 
            fixed = TRUE )[[ 1L ]][ 1L ] 
            #   Take the "y" from the "y.z" part of the 
            #   minor part of the version number
        
        RVersion <- paste( 
            sep = "", 
            "R (>= ", 
            RVersion[["major"]], 
            ".", 
            sprintf( "%s.0", vMinor ), # RVersion[["minor"]], 
            ")" 
        )   
    }   
    
    desc[[ "Depends" ]] <- paste( 
        c( RVersion, pkgDepends ), 
        collapse = ",\n" 
    )   
    desc[[ "Depends" ]] <- paste( "\n", desc[[ "Depends" ]], sep = "" )
    
    
    # Write the Suggests field:
    if( !is.null( pkgSuggests ) ){ 
        desc[[ "Suggests" ]] <- paste( 
            pkgSuggests, 
            collapse = ",\n" 
        )   
        
        desc[[ "Suggests" ]] <- paste( "\n", desc[[ "Suggests" ]], sep = "" )
    }else{ 
        desc <- desc[ names(desc) != "Suggests" ] 
    }   
    
    
    # Write the Imports field:
    if( !is.null( pkgImports ) ){ 
        desc[[ "Imports" ]] <- paste( 
            pkgImports, 
            collapse = ",\n" 
        )   
        
        desc[[ "Imports" ]] <- paste( "\n", desc[[ "Imports" ]], sep = "" )
    }else{ 
        desc <- desc[ names(desc) != "Imports" ] 
    }   
    
    
    # Final output formatting:
    nm <- names( desc ) 
    
    desc <- unlist( lapply(
        X   = 1:length(desc), 
        FUN = function( X, desc, nm ){ 
            desc[[ X ]] <- gsub( 
                x           = desc[[ X ]], 
                pattern     = "\n", 
                replacement = "\n    ", 
                fixed       = TRUE 
            )   
            
            paste0( nm[X], ": ", desc[[ X ]] )  
        },  
        desc = desc, 
        nm   = nm 
    ) ) 
    
    
    # Write again the description file:
    desc <- writeLines( 
        con = file.path( 
            pkgDir, 
            pkgName, 
            "DESCRIPTION" 
        ),  #
        text = desc 
    )   
    
    # Invisibly returns the text of the description file
    return( invisible( desc ) ) 
### The function chnages the description file, and invisibly returns 
### the text of the file.
}   #



pdu_message <- function( fmt, ... ){
    message( sprintf( fmt, ... ) )
    flush.console() 
}   



pdu_detach <- function(pkgName){ 
    if( pkgName %in% .packages() )
    
    do.call( 
        what = "detach", 
        args = list( 
            "name" = sprintf( "package:%s", pkgName ), 
            "character.only" = TRUE ) ) 
}   



pdu_rcmdbuild <- function(
    pkgName, 
    pkgDir, 
    buildDir = NULL, 
    gitRevison = TRUE, 
    noVignettes = FALSE, 
    compactVignettes = NULL, # "gs+qpdf" 
    md5 = TRUE
){  
    oldwd <- getwd() 
    on.exit( setwd( oldwd ) )
    setwd( file.path( pkgDir, pkgName ) )
    
    pdu_message( "--- Export git revision --------------------------------\n" )
    
    if( gitRevison ){
        cmd <-  sprintf( 
            "git log -n 1 --oneline --no-notes > inst\\GIT_VERSION" )
        
        pdu_message( sprintf( "COMMAND: %s\n\n", cmd ) )
        
        shell( cmd )
    }   
    
    pdu_message( "--- Call R CMD build -----------------------------------\n" )
    
    if( is.null( buildDir ) ){ buildDir <- pkgDir }
    
    setwd( buildDir )
    
    .noVignettes <- ifelse( noVignettes, "--no-vignettes", "" )
    .compactVignettes <- ifelse( 
        (!noVignettes) & (!is.null(compactVignettes)),  
        sprintf( '--compact-vignettes="%s"', compactVignettes ), 
        "" )
    .md5 <- ifelse( md5, "--md5", "" )
    
    cmd <- sprintf( "R CMD build %s %s %s", .compactVignettes, 
        .md5, normalizePath(file.path(pkgDir,pkgName)) )
    
    pdu_message( sprintf( "COMMAND: %s\n\n", cmd ) )
    
    out <- shell( cmd )
      
    return( out )
}   



pdu_rcmdcheck <- function(
    pkgName, 
    pkgDir, 
    buildDir = NULL, 
    noExamples = FALSE, 
    noTests = FALSE, 
    noVignettes = FALSE, 
    asCRAN = FALSE 
){  
    oldwd <- getwd() 
    on.exit( setwd( oldwd ) )
    
    if( is.null( buildDir ) ){ buildDir <- pkgDir }
    
    setwd( buildDir )
    
    
    
    pdu_message( "--- Call R CMD check -----------------------------------\n" )
    #   Find latest tar.gz binary
    f <- list.files( path = buildDir, pattern = ".tar.gz" )
    f <- f[ grepl( pattern = pkgName, x = f, ignore.case = FALSE, 
        fixed = TRUE ) ]
    f <- sort( f ) 
    f <- f[ length(f) ] 
    f <- file.path( buildDir, f )
    
    # setwd( buildDir )
    
    .noExamples <- ifelse( noExamples, "--no-examples ", " " )
    .noTests <- ifelse( noTests, "--no-tests ", " " )
    .noVignettes <- ifelse( noVignettes, "--no-vignettes ", " " )
    .asCRAN <- ifelse( asCRAN, "--as-cran ", " " )
    
    cmd <- sprintf( "R CMD check %s%s%s%s%s", .noExamples, 
        .noTests, .noVignettes, .asCRAN, normalizePath(f) )
    
    pdu_message( sprintf( "COMMAND: %s\n\n", cmd ) )
    
    out <- shell( cmd )
      
    return( out )
}   



pdu_rcmdinstall <- function(
    pkgName, 
    pkgDir, 
    buildDir = NULL, 
    build = TRUE, 
    compactDocs = TRUE, 
    byteCompile = TRUE, 
    compileBoth = FALSE 
){  
    oldwd <- getwd() 
    on.exit( setwd( oldwd ) )
    
    if( is.null( buildDir ) ){ buildDir <- pkgDir }
    
    setwd( buildDir )
    
    
    
    pdu_message( "--- Call R CMD check -----------------------------------\n" )
    #   Find latest tar.gz binary
    f <- list.files( path = buildDir, pattern = ".tar.gz" )
    f <- f[ grepl( pattern = pkgName, x = f, ignore.case = FALSE, 
        fixed = TRUE ) ]
    f <- sort( f ) 
    f <- f[ length(f) ] 
    f <- file.path( buildDir, f )
    
    # setwd( buildDir )
    
    .build <- ifelse( build, "--build ", " " )
    .compactDocs <- ifelse( compactDocs, "--compact-docs ", " " )
    .byteCompile <- ifelse( build, "--byte-compile ", " " )
    .compileBoth <- ifelse( compileBoth, "---compile-both ", " " )
    
    cmd <- sprintf( "R CMD INSTALL %s%s%s%s%s", .build, 
        .compactDocs, .byteCompile, .compileBoth, normalizePath(f) )
    
    pdu_message( sprintf( "COMMAND: %s\n\n", cmd ) )
    
    out <- shell( cmd )
      
    return( out )
}   



pdu_rm_Rcheck <- function(
    pkgName, 
    pkgDir, 
    buildDir = NULL
){  
    oldwd <- getwd() 
    on.exit( setwd( oldwd ) )
    
    if( is.null( buildDir ) ){ buildDir <- pkgDir }
    
    setwd( buildDir )
    
    
    
    pdu_message( "--- Remove .Rcheck folder ------------------------------\n" )
    
    # cmd <- sprintf( "RMDIR /S /Q %s", 
        # normalizePath( file.path( buildDir, 
        # sprintf( "%s.Rcheck", pkgName ) ) ) )
    
    cmd <- sprintf( "RMDIR /S /Q %s.Rcheck", 
        pkgName )
    
    pdu_message( sprintf( "COMMAND: %s\n\n", cmd ) )
    
    out <- shell( cmd )
      
    return( out )
}   

pdu_build_vignette <- function(
    RnwFile, 
    pkgName, 
    pkgDir, 
    buildDir = NULL, 
    pdf         = TRUE, 
    quiet       = TRUE 
){  
    oldwd <- getwd() 
    op <- options()
    on.exit( setwd( oldwd ) )
    on.exit( options( op ), add = TRUE )
    
    if( is.null( buildDir ) ){ buildDir <- pkgDir }
    
    
    vignettesDir <- file.path( pkgDir, pkgName, "vignettes" )
    setwd( vignettesDir )
    
    if( missing( "RnwFile" ) ){ stop( "Argument 'RnwFile' is missing, with no default." ) }
    
    
    
    pdu_message( "--- Build vignette -------------------------------------\n" )
    
    pdu_message( "--- Stangle()\n" )
    
    Stangle( RnwFile, quiet = quiet ) 
    
    pdu_message( "--- Sweave()\n" )
    
    Sweave( RnwFile, quiet = quiet ) 
    
    pdu_message( "--- tools::texi2dvi()\n" )
    
    for( clean in c(FALSE,FALSE,TRUE) ){ 
        msg <- tools::texi2dvi( 
            file        = sub( pattern = ".Rnw", 
                replacement = ".tex", x = RnwFile, 
                fixed = TRUE ), 
            pdf         = pdf, 
            quiet       = quiet,  
            clean       = clean, 
            texinputs   = getwd() 
        )   
    }   
    
    ## Copy the vignette's pdf into the 'build' folder
    pdfFile <- sub( pattern = ".Rnw", replacement = ".pdf", 
        x = RnwFile, fixed = TRUE )

    # pdu_message( "--- tools::compactPDF()\n" )
    
    # tools::compactPDF( paths = pdfFile, gs_quality = "ebook")
    
    file.copy( 
        from      = pdfFile, 
        to        = file.path( buildDir, pdfFile ), 
        overwrite = TRUE )    
    
    # file.copy( 
        # from      = pdfFile, 
        # to        = file.path( pkgDir, pkgName, "inst", "doc", pdfFile ), 
        # overwrite = TRUE )    
    

    for( ext in c( "\\.tex$", "\\.bib.bak$", "\\.R$", "\\.aux$", 
        "\\.bbl$", "\\.blg$", "\\.log$", "\\.out$", "\\.toc$", "\\.pdf$", "\\.dvi$" ) ){ # 
        
        file.remove( list.files( getwd(), ext, full.names = TRUE ) ) 
    }   
    
    return( invisible( msg ) )
}   



pdu_rd2pdf <- function(
    pkgName, 
    pkgDir, 
    buildDir = NULL 
){  
    oldwd <- getwd() 
    on.exit( setwd( oldwd ) )
    
    if( is.null( buildDir ) ){ buildDir <- pkgDir }
    
    setwd( pkgDir )
    
    
    
    pdu_message( "--- Call R CMD check -----------------------------------\n" )
    #   Find latest tar.gz binary
    f <- list.files( path = buildDir, pattern = ".tar.gz" )
    f <- f[ grepl( pattern = pkgName, x = f, ignore.case = FALSE, 
        fixed = TRUE ) ]
    f <- sort( f ) 
    f <- f[ length(f) ] 
    
    #   Extract prefix (no extension)
    pdfFile <- sub( pattern = ".tar.gz", replacement = ".pdf", 
        x = f, ignore.case = FALSE, fixed = TRUE ) 
    
    # pdfFile <- file.path( normalizePath( buildDir ), pdfFile )
    
    # setwd( buildDir )
        
    cmd <- sprintf( "R CMD Rd2pdf %s --batch --no-preview --output=%s", 
        pkgName, pdfFile )
    
    pdu_message( sprintf( "COMMAND: %s\n\n", cmd ) )
    
    out <- shell( cmd )
    
    # ## Copy the manual's pdf into the 'build' folder
    if( normalizePath( buildDir ) != normalizePath( pkgDir ) ){
        file.copy( 
            from      = pdfFile, 
            to        = file.path( buildDir, pdfFile ), 
            overwrite = TRUE )    
        
        file.remove( pdfFile ) 
    }   
    shell.exec( file.path( buildDir, pdfFile ) )
    
    return( out )
}   

