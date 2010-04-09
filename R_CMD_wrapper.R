if( !"inlinedocs" %in%  as.character( installed.packages()[,1] ) ) 
{   #
    install.packages("inlinedocs")  
}   #



require(inlinedocs)



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



pkg.remove.wrapper <- function 
### A wrapper for the function 'remove.packages()' that checks 
### if the package is installed before.
(   #
    pkg.name
### Name of the package 
){  #
    if( pkg.name %in%  as.character( installed.packages()[,1] ) ) 
    {   #
        remove.packages( pkg.name, lib = .Library )  
        #
        print( 
            paste( 
                "Package", 
                pkg.name, 
                "successfully / probably removed"  
            )   #
        )   #
    }else{ 
        print( 
            paste( 
                "Package", 
                pkg.name, 
                "NOT removed because NOT installed"  
            )   #
        )   #
    }   #
### Prints a message that state if the package has been removed 
### or if it has not been removed (because not installed).
}   #



pkg.description <- function( 
 pkg.name, 
### Name of the package, and of the package directory
 pkg.dir, 
### Name of the directory in which the package directory is
### located 
 pkg.version, 
### Version of the package, to be written in the DESCRIPTION file
 pkg.depends=NULL 
### Vector of character. Names of the packages that needs to be installed
### prior to the package installation. NULL if none
){  #
    # Read the file DESCRIPTION 
    desc <- readLines( 
        con = file.path( 
            pkg.dir, 
            pkg.name, 
            "DESCRIPTION" 
        )   #
    )   #
    #
    # Find where the "Date:" line is
    desc.sel <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Date:")  
    ) == "Date:"
    #
    # Modify the date
    desc[ desc.sel ] <- paste( 
        "Date:", 
        Sys.Date()  
    )   #
    #
    # Find where the "Date:" line is
    desc.sel <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Version:")  
    ) == "Version:"
    #
    # Modify the date
    desc[ desc.sel ] <- paste( 
        "Version:", 
        pkg.version  
    )   #
    #
    # Find where the "Depends:" line is
    desc.sel <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Depends:")  
    ) == "Depends:"
    #
    # Get R version:
    r.ver <- R.Version() 
    #
    # Modify the dependancies
    desc[ desc.sel ] <- paste( 
        "Depends:", 
        " R (>= ", 
        r.ver[["major"]], ".", r.ver[["minor"]], ")", 
        ifelse(is.null(pkg.depends),"",", "), 
        paste( pkg.depends, collapse = ", " ), 
        sep = "" 
    )   #
    #
    # Write again the description file:
    desc <- writeLines( 
        con = file.path( 
            pkg.dir, 
            pkg.name, 
            "DESCRIPTION" 
        ),  #
        text = desc 
    )   #
    #
    # Invisibly returns the text of the description file
    return( invisible( desc ) ) 
### The function chnages the description file, and invisibly returns 
### the text of the file.
}   #



pkg.build.wrapper <- function 
### A wrapper function for R CMD build, for building a package 
### from sources
(   #
 pkg.name, 
### Name of the package, and of the package directory
 pkg.dir, 
### Name of the directory in which the package directory is
### located 
 r.cmd= "R CMD build", 
### Command send to windows shell. Default is "R CMD build" 
 bat.suffix="RCMDchecks"
### Suffix of the batch (.bat) file create for this operation, 
### without extension
){  #
    cmd.build <- c( 
        "c:", 
        "cd \\", 
        paste( sep = "", "cd ", normalizePath( file.path( pkg.dir ) )), 
        paste( sep = "", r.cmd, " ", pkg.name )  
    )   #
    #
    cat( cmd.build ) 
    #
    bat.build <- file.path( 
        pkg.dir, 
        paste( 
            sep = "", 
            pkg.name, "_", 
            bat.suffix, ".bat" 
        )   #
    )   #
    #
    writeLines( 
        text = cmd.build, 
        con  = bat.build, 
        sep  = "\n"  
    )   #
    #
    sys.res <- system( 
        command     = bat.build,  #
        intern      = TRUE, 
        minimized   = TRUE, 
        invisible   = TRUE  
    )   #
    #
    file.remove( bat.build ) 
    #
    return( sys.res ) 
### The function returns the system / shell log 
}   #



pkg.install.wrapper <- function 
### A wrapper function for R CMD INSTALL --build, for building 
### a package from sources
(   #
    pkg.name, 
### Name of the package, and of the package directory
    pkg.dir, 
### Name of the directory in which the package directory is
### located 
    r.cmd       = "R CMD INSTALL --build", 
### Command send to windows shell. Default is "R CMD INSTALL --build" 
    bat.suffix  = "RCMDINSTALL"
### Suffix of the batch (.bat) file create for this operation, 
### without extension
){  #
    cmd.install <- c( 
        "c:", 
        "cd \\", 
        paste( sep = "", "cd ", normalizePath( file.path( pkg.dir ) )), 
        paste( sep = "", r.cmd, " ", pkg.name )  
    )   #
    #
    bat.install <- file.path( 
        pkg.dir, 
        paste( 
            sep = "", 
            pkg.name, "_", 
            bat.suffix, ".bat" 
        )   #
    )   #
    #
    writeLines( 
        text = cmd.install, 
        con  = bat.install, 
        sep  = "\n"  
    )   #
    #
    sys.res <- system( 
        command     = bat.install,  #
        intern      = TRUE, 
        minimized   = TRUE, 
        invisible   = TRUE  
    )   #
    #
    file.remove( bat.install ) 
    #
    return( sys.res ) 
### The function returns the system / shell log 
}   #



pkg.check.wrapper <- function 
### A wrapper function for R CMD check, for checking a package
### sources
(   #
    pkg.name, 
### Name of the package, and of the package directory
    pkg.dir, 
### Name of the directory in which the package directory is
### located 
    r.cmd       = "R CMD check", 
### Command send to windows shell. Default is "R CMD check" 
    bat.suffix  = "RCMDcheck"
### Suffix of the batch (.bat) file create for this operation, 
### without extension
){  #
    cmd.checks <- c( 
        "c:", 
        "cd \\", 
        paste( sep = "", "cd ", normalizePath( file.path( pkg.dir ) )), 
        paste( sep = "", r.cmd, " ", pkg.name )  
    )   #
    #
    cat( cmd.checks ) 
    #
    bat.checks <- file.path( 
        pkg.dir, 
        paste( 
            sep = "", 
            pkg.name, "_", 
            bat.suffix, ".bat" 
        )   #
    )   #
    #
    writeLines( 
        text = cmd.checks, 
        con  = bat.checks, 
        sep  = "\n"  
    )   #
    #
    sys.res <- system( 
        command     = bat.checks,  #
        intern      = TRUE, 
        minimized   = TRUE, 
        invisible   = TRUE  
    )   #
    #
    file.remove( bat.checks ) 
    #
    Rcheck.dir <- paste( 
        sep = "", 
        pkg.name, 
        ".Rcheck"  
    )   #
    #
    zipMe( 
        file.name = Rcheck.dir,  
        file.dir  = pkg.dir 
    )   #
    #
    shell( 
        cmd = paste( 
            "rmdir /S /Q \"", 
            file.path( 
                pkg.dir, 
                Rcheck.dir
            ),  #
            "\"", 
            sep = "" 
        ),  #
        intern = TRUE, 
        wait   = TRUE  
    )   #
    #
    # unlink( 
    #     x         = file.path( 
    #         pkg.dir, 
    #         Rcheck.dir
    #     ),  #
    #     recursive = TRUE 
    # )   #
    #
    return( sys.res ) 
### The function returns the system / shell log 
}   #






install.packages.zip <- function( 
 pkg.name, 
### Name of the package, and of the package directory
 pkg.dir, 
### Name of the directory in which the package directory is
### located 
 pkg.version 
### Version of the package, to be written in the DESCRIPTION file
){  #
    install.packages( 
        pkgs = file.path( 
            pkg.dir, 
            paste( 
                pkg.name, 
                "_", 
                pkg.version, 
                ".zip", 
                sep = ""
            )   #
        ),  #
        repos = NULL 
    )   #
### The function returns nothing
}   #



