


pkgRemove <- function(# Remove a package
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



pkgDescription <- function(# Modify a package's DESCRIPTION file
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

 pkgSuggests=NULL,
### Vector of character string. Names of the packages that needs 
### to be cited in the "Suggests" field. NULL if none

 pkgImports=NULL
### Vector of character string. Names of the packages that needs 
### to be cited in the "Imports" field. NULL if none

){  
    # Read the file DESCRIPTION 
    desc <- readLines( 
        con = file.path( 
            pkgDir, 
            pkgName, 
            "DESCRIPTION" 
        )   #
    )   #
    
    # Find where the "Date:" line is
    desc.sel <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Date:")  
    ) == "Date:"
    
    # Modify the date
    desc[ desc.sel ] <- paste( 
        "Date:", 
        Sys.Date()  
    )   #
    
    # Find where the "Version:" line is
    desc.sel <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Version:")  
    ) == "Version:"
    
    # Modify the version
    desc[ desc.sel ] <- paste( 
        "Version:", 
        pkgVersion  
    )   #
    
    # Find where the "Depends:" line is
    desc.sel <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Depends:")  
    ) == "Depends:"
    
    if( is.null( RVersion ) )
    {   
        # Get R version:
        RVersion <- R.Version() 
        
        RVersion <- paste( 
            sep = "", 
            "R (>= ", 
            RVersion[["major"]], 
            ".", 
            RVersion[["minor"]], 
            ")" 
        )   
    }   
    
    # Modify the dependancies
    desc[ desc.sel ] <- paste( 
        "Depends: ", 
        RVersion, 
        ifelse(is.null(pkgDepends),"",", "), 
        paste( pkgDepends, collapse = ", " ), 
        sep = "" 
    )   
    
    
    
    # Find where the "Suggests:" line is
    desc.sel2 <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Suggests:")  
    ) == "Suggests:"
    
    suggests.txt <- paste( 
        "Suggests: ", 
        paste( pkgSuggests, collapse = ", " ), 
        sep = "" 
    )   
    
    if( is.null( pkgSuggests ) ){ 
        desc <- desc[ !desc.sel2 ]
        
    }else{ 
        if( any( desc.sel2 ) ){   
            desc[ desc.sel2 ] <- suggests.txt 
        }else{ 
            desc <- c(
                desc, 
                suggests.txt 
            )   
        }   
    }   
    
    
    
    # Find where the "Imports:" line is
    desc.sel2 <- substr( 
        x     = desc, 
        start = 1, 
        stop  = nchar("Imports:")  
    ) == "Imports:"
    
    imports.txt <- paste( 
        "Imports: ", 
        paste( pkgImports, collapse = ", " ), 
        sep = "" 
    )   
    if( is.null( pkgImports ) ){ 
        desc <- desc[ !desc.sel2 ]
        
    }else{ 
        if( any( desc.sel2 ) )
        {   
            desc[ desc.sel2 ] <- imports.txt 
        }else{ 
            desc <- c(
                desc, 
                imports.txt 
            )   
        }   
    }   
    
    
    
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
