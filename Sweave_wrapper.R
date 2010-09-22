texi2dvi.wrapper <- function(# Internal. Wrapper for tools:texi2dvi.
### This function is a wrapper to tools:texi2dvi that also deletes 
### the images when the pdf file was created

    file.name.root, 
### Root of the sweave (and tex) file name (without extention) 

    work.wd, 
### Path of the working directory 

    inout.dir, 
### Path of the subdirectory in which the images are outputted 

    tex.ext     = ".tex"
### Tex file extesion. Any other value than ".tex" may not work 

){  #
    old.dir <- getwd() 
    #
    setwd( work.wd ) 
    #
    testfile2   <- paste( 
        file.name.root, 
        tex.ext, 
        sep = "" 
    )   #
    #
    msg <- tools::texi2dvi( 
        file        = testfile2, 
        pdf         = TRUE, 
        clean       = TRUE, 
        texinputs   = work.wd 
    )   # 
    #
    cat( "\n\n\n" ) 
    cat( paste( "tools::texi2dvi message ", msg, "\n\n\n" ) ) 
    #
    ## Clean the inout directory
    if( all( is.null(msg) ) ) 
    {   #
        if( inout.dir != "" )
        {   #
            inout.wd <- file.path( work.wd, inout.dir ) 
        }else{ 
            inout.wd <- work.wd 
        }   #
        #
        files.lst <- list.files( 
            path        = inout.wd, 
            full.names  = TRUE  
        )   #
        #
        files.nbc <- nchar( files.lst ) 
        #
        files.ext <- substr( 
            x       = files.lst, 
            start   = files.nbc - 2, 
            stop    = files.nbc
        )   #
        #
        file.name.root2 <- file.path( inout.wd, paste( file.name.root, "-", sep = "" ) )
        #
        files.pre <- substr( 
            x       = files.lst, 
            start   = 1, 
            stop    = nchar( file.name.root2 ) 
        )   #
        #
        sel.del <- (files.ext %in% c("pdf","eps")) &  
                   (files.pre == file.name.root2 )  
        #
        rm.res  <- file.remove( files.lst[ sel.del ] ) 
        #
        cat( "\n\n\n" ) 
        cat( paste( "Number of images deleted:",     sum(  rm.res ), "\n" ) ) 
        cat( paste( "Number of images not deleted:", sum( !rm.res ), "\n\n\n" ) ) 
        #
        return( TRUE ) 
    }else{ 
        cat( "No images deleted. Something went wrong\n\n\n" ) 
        #
        return( FALSE ) 
    }   #
    #
    setwd( old.dir ) 
    #
### The function returns several messages about the Stangle, Sweave, 
### tools::texi2dvi and image deleting processes. It also returns 
### TRUE if the images were deleted, and FALSE if not
}   #



Sweave.wrapper <- function(# Wrapper around Stangle, Sweave and tools::texi2dvi 
### Sweave.wrapper is a function that performs different 
### operations otherwise done step by step with Stangle, Sweave and 
### tools::texi2dvi, and that do a bit of cleaning in the folder 
### after that (delete images)

    file.name.root, 
### Root of the sweave (and tex) file name (without extention) 

    work.wd, 
### Path of the working directory 

    inout.dir, 
### Path of the subdirectory in which the images are outputted 

    sweave.ext  = ".Rnw", 
### Sweave file extesion. Any other value than ".Rnw" may not work 

    tex.ext     = ".tex"
### Tex file extesion. Any other value than ".tex" may not work 

){  #
    old.dir <- getwd() 
    #
    setwd( work.wd ) 
    #
    testfile    <- paste( 
        file.name.root, 
        sweave.ext, 
        sep = "" 
    )   #
    #
    cat( paste( "Ready to process ", testfile, "\n\n\n" ) ) 
    #
    ## enforce par(ask=FALSE)
    options(device.ask.default=FALSE)
    #
    # Extract the R code from the Sweave file
    Stangle( testfile ) 
    #
    ## create a LaTeX file
    Sweave( testfile ) 
    #
    setwd( work.wd ) 
    #
    res <- texi2dvi.wrapper( 
        file.name.root  = file.name.root, 
        work.wd         = work.wd, 
        inout.dir       = inout.dir, 
        tex.ext         = tex.ext  
    )   #
    #
    setwd( old.dir ) 
    #
    return( res ) 
### The function returns several messages about the Stangle, Sweave, 
### tools::texi2dvi and image deleting processes. It also returns 
### TRUE if the images were deleted, and FALSE if not
}   #



MC.search.path <- function
### Search if a given file is present along the system PATH
### Function created after Vladimir Eremeev, who created it after 
### Brian Ripley.
### <http://finzi.psych.upenn.edu/R/Rhelp02/archive/101078.html> or 
### <http://finzi.psych.upenn.edu/R/Rhelp02/archive/92829.html> 

(   #
    file.name   = "7z.exe", 
### Name of the 7zip command line file.
    s.path      = Sys.getenv("PATH"), 
### Value of windwos PATH variable. Default is set to Sys.getenv("PATH") 
    p.sep       = .Platform$path.sep
### Platform specific folder separator in pathes. Default set to .Platform$path.sep 
){  #
    s.path  <- strsplit(
        x       = s.path, 
        split   = p.sep
    )[[1]] 
    #
    tmp <- lapply( 
        X   = s.path, 
        FUN = function(X){ 
            fp <- file.path(X, file.name) 
            #
            file.exists( fp ) 
        }   #
    )   #
    #
    return( any( unlist( tmp ) ) ) 
### Returns TRUE if 7zip command line executable was found in along the PATH 
}   #



zipMe <- function
### ZipMe is an R wrapper for 7zip command line executable. It is 
### used to compress files in ZIP archives format

(   #
    file.name, 
### Name of the file to be zipped.
    file.dir, 
### Directory of the file to be zipped.
    zip.name        = "7z.exe", 
### Name of the 7zip command line file.
    intern          = TRUE, 
### See ?system .
    ignore.stderr   = FALSE, 
### See ?system .
    wait            = TRUE, 
### See ?system .
    input           = NULL, 
### See ?system .
    show.output.on.console  = TRUE, 
### See ?system .
    minimized       = TRUE, 
### See ?system .
    invisible       = TRUE
### See ?system .
){  #
    old.dir <- getwd() 
    #
    setwd( file.dir )
    #
    z7 <- MC.search.path( file.name = zip.name ) 
    #
    if( z7 )
    {   #
        z7.cmd <- paste(
            sep = "", 
            "7z a -tzip -mx=1 ", 
            file.name, ".zip ", 
            file.name  
        )   #
        #
        sys.msg <- system( 
            command         = z7.cmd,
            intern          = intern,
            ignore.stderr   = ignore.stderr,
            wait            = wait,
            input           = input,
            show.output.on.console  = show.output.on.console,
            minimized       = minimized,
            invisible       = invisible
        )   #
        #
        cat( sys.msg ) 
    }else{ 
        message("7zip not found. Files were not zipped") 
    }   #
    #
    setwd( old.dir ) 
}   #

