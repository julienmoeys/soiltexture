


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

 pkgImports=NULL, 
### Vector of character string. Names of the packages that needs 
### to be cited in the "Imports" field. NULL if none

 pkgSuggests=NULL
### Vector of character string. Names of the packages that needs 
### to be cited in the "Suggests" field. NULL if none

){  
    # Read the file DESCRIPTION 
    desc <- packageDescription(
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
        
        RVersion <- paste( 
            sep = "", 
            "R (>= ", 
            RVersion[["major"]], 
            ".", 
            RVersion[["minor"]], 
            ")" 
        )   
    }   
    
    desc[[ "Depends" ]] <- paste( 
        c( RVersion, pkgDepends ), 
        collapse = ", " 
    )   
    
    
    # Write the Suggests field:
    if( !is.null( pkgSuggests ) ){ 
        desc[[ "Suggests" ]] <- paste( 
            pkgSuggests, 
            collapse = ", " 
        )   
    }else{ 
        desc <- desc[ names(desc) != "Suggests" ] 
    }   
    
    
    # Write the Imports field:
    if( !is.null( pkgImports ) ){ 
        desc[[ "Imports" ]] <- paste( 
            pkgImports, 
            collapse = ", " 
        )   
    }else{ 
        desc <- desc[ names(desc) != "Imports" ] 
    }   
    
    
    # Final output formatting:
    nm <- names( desc ) 
    
    desc <- unlist( lapply(
        X   = 1:length(desc), 
        FUN = function( X, desc, nm ){ 
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
