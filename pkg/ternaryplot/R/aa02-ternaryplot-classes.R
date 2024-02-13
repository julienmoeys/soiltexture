
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                   |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+



# ternaryCheck =========================================================

#'Check the validity of ternary*-class objects
#'
#'Check the validity of ternary*-class objects
#'
#'
#'@seealso Arguments \code{onFailure} and \code{okClock} in 
#'  \code{\link[ternaryplot]{getTpPar}} (package options).
#'
#'
#'@param x 
#'  A ternary*-class object.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'
#'@rdname ternaryCheck-methods
#'
#'@export 
#'
ternaryCheck <- function(
 x, 
 ... 
){  
    UseMethod( "ternaryCheck" ) 
}   



#'@rdname ternaryCheck-methods
#'
#'@method ternaryCheck ternaryGeometry
#'
#'@export
#'
ternaryCheck.ternaryGeometry <- function(
 x, 
 # onFailure=stop, 
 ... 
){  
    valid <- TRUE 
    
    onFailure <- getTpPar( "onFailure" ) 
    
    #   Check names:
    nm <- c( "tlrAngles", "blrClock", "fracSum" )
    testNames <- nm %in% names( x ) 
    
    if( any( !testNames ) ){ 
        onFailure( sprintf( 
            "Some items (or item-labels) are missing: %s", 
            paste( nm, collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testNames ) 
    
    
    #   Check tlrAngles
    testTlrAngles <- 
        ( length( x[[ "tlrAngles" ]] ) == 3 )   & 
        is.numeric( x[[ "tlrAngles" ]] )        & 
        ( sum( x[[ "tlrAngles" ]] ) == 180 ) 
    
    
    if( !testTlrAngles ){ 
        onFailure( sprintf( 
            "'tlrAngles' must be 3 numerical values summing to 180 degrees (now %s)", 
            paste( x[[ "tlrAngles" ]], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testTlrAngles ) 
    
    
    #   Check blrClock:
    testBlrClock <- 
        ( length( x[[ "blrClock" ]] ) == 3 )    & 
        is.logical( x[[ "blrClock" ]] ) 
    
    if( !testBlrClock ){ 
        onFailure( sprintf( 
            "'blrClock' must be 3 logical values (now %s)", 
            paste( x[[ "blrClock" ]], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testBlrClock ) 
    
    
    okClock <- getTpPar( "okClock" ) 
    
    okClock <- unlist( lapply( 
        X        = okClock, 
        FUN      = function( X ){ 
            identical( x[[ "blrClock" ]], X ) 
        }   
    ) )  
    
    if( !any(okClock) ){   
        onFailure( "Invalid 'blrClock'. See getTpPar( 'okClock' ) for accepted values." ) 
        
        valid <- FALSE 
    };  rm( okClock )

    
    
    #   Check fracSum
    testFracSum <- 
        ( length( x[[ "fracSum" ]] ) == 1 )     & 
        is.numeric( x[[ "fracSum" ]] )          & 
        all( x[[ "fracSum" ]] %in% c( 1, 100 ) )
    
    if( !testFracSum ){ 
        onFailure( sprintf( 
            "'fracSum' must be 1 numerical values, either 1 or 100 (now %s)", 
            paste( x[[ "fracSum" ]], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testFracSum ) 
    
    
    return( valid ) 
}   



#'@rdname ternaryCheck-methods
#'
#'@method ternaryCheck ternaryVariables
#'
#'@export
#'
ternaryCheck.ternaryVariables <- function(
 x, 
 # onFailure=stop, 
 ... 
){  
    valid <- TRUE 
    
    onFailure <- getTpPar( "onFailure" ) 
    
    #   Check names:
    nm <- c( "blrNames", "blrLabels" )
    testNames <- nm %in% names( x ) 
    
    if( any( !testNames ) ){ 
        onFailure( sprintf( 
            "Some items (or item-labels) are missing: %s", 
            paste( nm, collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testNames ) 
    
    
    #   Check blrNames
    testBlrNames <- 
        ( length( x[[ "blrNames" ]] ) == 3 )   & 
        is.character( x[[ "blrNames" ]] ) 
    
    
    if( !testBlrNames ){ 
        onFailure( sprintf( 
            "'blrNames' must be 3 character strings (now %s)", 
            paste( x[[ "blrNames" ]], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testBlrNames ) 
    
    
    #   Check blrLabels
    testBlrLabels <- 
        ( length( x[[ "blrLabels" ]] ) == 3 )   & 
        ( class( x[[ "blrLabels" ]] ) %in% c( "character", "expression", "name", "call" ) ) 
    
    
    if( !testBlrLabels ){ 
        onFailure( sprintf( 
            "'blrLabels' must be an object of class character, expression, name or call and length 3 (now %s)", 
            paste( x[[ "blrLabels" ]], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testBlrLabels ) 
    
    
    return( valid ) 
}   



#'@rdname ternaryCheck-methods
#'
#'@method ternaryCheck ternarySystem
#'
#'@export
#'
ternaryCheck.ternarySystem <- function(
 x, 
 # onFailure=stop, 
 ... 
){  
    valid <- TRUE 
    
    onFailure <- getTpPar( "onFailure" ) 
    
    #   Check names:
    nm <- c( "ternaryGeometry", "ternaryVariables", "main", 
        "vertices", "classes", "scale" )
    testNames <- nm %in% names( x ) 
    
    if( any( !testNames ) ){ 
        onFailure( sprintf( 
            "Some items (or item-labels) are missing: %s", 
            paste( nm[ !testNames ], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testNames ) 
    
    
    valid <- ternaryCheck( x[[ "ternaryGeometry" ]], onFailure = onFailure, ... )
    valid <- ternaryCheck( x[[ "ternaryVariables" ]], onFailure = onFailure, ... )
    
    
    #   Check main
    testMain <- 
        ( length( x[[ "main" ]] ) %in% c(1,0) )   & 
        ( class( x[[ "main" ]] ) %in% c( "character", "expression", "name", "call" ) ) 
    
    if( !testMain ){ 
        onFailure( sprintf( 
            "'main' must be an object of class character, expression, name or call and length 1 (now %s)", 
            paste( x[[ "main" ]], collapse = "; " ) 
        ) ) 
        
        valid <- FALSE 
    };  rm( testMain ) 
    
    
    #   Check vertices
    verticesDefault <- getTpPar( "vertices" ) 
    
    cn <- c( colnames(verticesDefault)[1], 
        x[[ "ternaryVariables" ]][[ "blrNames" ]] )
    
    testCol <- cn %in% colnames( x[[ "vertices" ]] ) 
    
    if( !all( testCol ) ){ 
        onFailure( sprintf( 
            "Some columns are missing in 'vertices': %s", 
            paste( cn[ !testCol ], collapse = "; " )
        ) ) 
        
        valid <- FALSE 
    };  rm( testCol ) 
    
    
    #   Test classes:
    cn2 <- colnames( getTpPar( "classes" ) ) 
    
    testCol <- cn2 %in% colnames( x[[ "classes" ]] ) 
    
    if( !all( testCol ) ){ 
        onFailure( sprintf( 
            "Some columns are missing in 'classes': %s", 
            paste( cn2[ !testCol ], collapse = "; " )
        ) ) 
        
        valid <- FALSE 
    };  rm( testCol ) 
    
    
    #   Test class x vertices
    verticesId <- unlist( x[[ "classes" ]][, "verticesId" ] ) 
    id         <- x[[ "vertices" ]][, "id" ] 
    testClaVer <- verticesId %in% id 
    
    if( any( !testClaVer ) ){ 
        onFailure( sprintf( 
            "Some classes[, 'verticesId' ] are missing in vertices[, 'id']: %s", 
            paste( verticesId[ !testClaVer ], collapse = "; " )
        ) ) 
        
        valid <- FALSE 
    };  rm( testClaVer )
    
    
    testClaVer2 <- id %in% verticesId  
         
    
    if( any( !testClaVer2 ) ){ 
        onFailure( sprintf( 
            "Some vertices[, 'id'] are missing in classes[, 'verticesId' ]: %s", 
            paste( id[ !testClaVer2 ], collapse = "; " )
        ) ) 
        
        valid <- FALSE 
    };  rm( testClaVer2 )
    
    
    #   Test scale:
    testCol <- cn[ -1 ] %in% colnames( x[[ "scale" ]] ) 
    
    if( !all( testCol ) ){ 
        onFailure( sprintf( 
            "Some columns are missing in 'scale': %s", 
            paste( cn[ -1 ][ !testCol ], collapse = "; " )
        ) ) 
        
        valid <- FALSE 
    };  rm( testCol ) 
    
    testRow <- 
        ( nrow( x[[ "scale" ]] ) == 2L ) & 
        all( c( "min", "max" ) %in% rownames( x[[ "scale" ]] ) ) 
    
    if( !testRow ){ 
        onFailure( "scale must have two rows, labelled 'min' and 'max'" ) 
        
        valid <- FALSE 
    };  rm( testRow ) 
    
    
    testDiff <- as.numeric( x[[ "scale" ]][ 2, ] - x[[ "scale" ]][ 1, ] ) 
    testDiff <- all( testDiff == testDiff[1] ) 
    
    if( any( !testDiff ) ){  
        onFailure( "In 'scale', the difference between min and max must be identica" ) 
        
        valid <- FALSE 
    }   
    
    
    return( valid ) 
}   



# createTernaryGeometry ============================================

## # Function that generates the class of ternaryGeometry object 
## # (mostly the 2nd class) after the blrClock-argument.
.generateTernaryGeometryClass <- function( 
 blrClock 
){  
    if( !"logical" %in% ( blrClock ) ){
        sprintf(
            "'blrClock' is not a logical (but: %s).", 
            paste( class( blrClock ), collapse = "; " )
        )   
    }      
    
    if( all( blrClock ) ){
        class2 <- "geo_TTT"
        
    }else if( all( !blrClock ) ){
        class2 <- "geo_FFF"
        
    }else if( all( blrClock == c( FALSE, TRUE, NA ) ) ){
        class2 <- "geo_FTX"
        
    }else if( all( blrClock == c( TRUE, NA, FALSE ) ) ){
        class2 <- "geo_TXF"
        
    }else{
        class2 <- character(0)
        
    }   
    
    return( c( "ternaryGeometry", class2 ) )
}   

#'Creates a ternaryGeometry object: ternary plot geometry definition.
#'
#'Creates a ternaryGeometry object: ternary plot geometry definition.
#'
#'  In this package, ternary plots geometries are defined by the 
#'  3 triangle's angles (top, left, right), and by the sum of the 
#'  3 fractions it represents (1 if a fraction, and 100 if a 
#'  percentage). 
#'
#'
#'@param tlrAngles
#'  Vector of numeric. Top, left and right angle (in degrees) 
#'  of the ternary diagram. Must sum to 180 degrees.
#'
#'@param blrClock
#'  Vector of logical value. Bottom, left and right axis directions. 
#'  Set to \code{TRUE} if the axis is clockwise, and to 
#'  \code{FALSE} if the axis is counter-clockwise.
#'
#'@param fracSum
#'  Single numeric value. Sum of the three fractions. Must be 1 (if 
#'  a fraction) or 100 (if a percentage).
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}
#'
#'
#'@return
#'  Return a list of \code{ternaryGeometry}-class (S3). A 2nd class is added 
#'  that depends on \code{blrClock}, and is formed after the pattern 
#'  \code{"geo_[blrClockCode]"}, where \code{[blrClockCode]} can be 
#'  \code{"TTT"}, \code{"FFF"}, \code{"FTX"} or \code{"TXF"}.
#'
#'
#'@example inst/examples/createTernaryGeometry-example.R
#'
#'
#'@rdname createTernaryGeometry
#'
#'@export
#'
createTernaryGeometry <- function(
 tlrAngles  = c( 60, 60, 60 ), 
 blrClock   = rep( TRUE, 3 ), 
 fracSum    = 100,  
 ...
){  
    #   Create a ternary geometry object:
    tg <- list( 
        "tlrAngles" = tlrAngles, 
        "blrClock"  = blrClock, 
        "fracSum"   = fracSum 
    )   
    
    
    #   Set the class
    class( tg ) <- .generateTernaryGeometryClass( 
        blrClock = tg[[ "blrClock" ]] ) 
    
    
    #   Check:
    ternaryCheck( tg, ... )

    
    
    return( tg ) 
}   



# createTernaryVariables ===========================================

#'Creates a ternaryVariables object: ternary plot variables definitions.
#'
#'Creates a ternaryVariables object: ternary plot variables definitions.
#'
#'  In this package, ternary plots variables are defined by the 3 
#'  variables name (bottom, left, right), as they will be found in 
#'  \code{\link[base]{data.frame}} containing ternary datasets, 
#'  and by the label of these variables on the axis of a ternary 
#'  plot.
#'
#'
#'@param blrNames
#'  Vector of characters. Bottom, left and right variable names 
#'  as they will be found in \code{data.frame} containing ternary 
#'  data.
#'
#'@param blrLabels
#'  Vector of characters or vector of expressions. Bottom, left 
#'  and right variable labels as they will be displayed on ternary 
#'  plots.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}
#'
#'
#'@example inst/examples/createTernaryVariables-example.R
#'
#'
#'@rdname createTernaryVariables
#'
#'@export 
#'
createTernaryVariables <- function(
 blrNames   = paste0( "F", 1:3 ), 
 blrLabels  = sprintf( "Fraction %s [%s]", 1:3, "%" ), 
 ...
){ 
    tv <- list( 
        "blrNames"  = blrNames, 
        "blrLabels" = blrLabels 
    )   
    
    #   Set the class
    class( tv ) <- "ternaryVariables"
    
    
    #   Check:
    ternaryCheck( tv, ... )
    
    
    return( tv ) 
}   



# createTernarySystem ===========================================

#'Creates a ternarySystem object: ternary plot system definition.
#'
#'Creates a ternarySystem object: ternary plot system 
#'  definition.
#'  
#'  Ternary systems are a combination of (a) a ternary 
#'  geometry (as defined by 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}), (b) a set of 
#'  ternary variables (as defined by 
#'  \code{\link[ternaryplot]{createTernaryVariables}} and an optional 
#'  classification system, that is polygons drawn on top of ternary 
#'  plots, that define different zones in the fractions.
#'
#'  The classification is defined by a collection of polygons (in 
#'  \code{classes}) with different \code{vertices}.
#'
#'
#'@param ternaryGeometry
#'  A ternary geometry (as defined by 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}). If \code{NULL}, 
#'  use the default output of \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#'@param ternaryVariables
#'  A set of ternary variables (as defined by 
#'  \code{\link[ternaryplot]{createTernaryVariables}}. If \code{NULL}, 
#'  use the default output of \code{\link[ternaryplot]{createTernaryVariables}}.
#'
#'@param main 
#'  Single character string. Title of the triangle plot.
#'
#'@param vertices
#'  See \code{\link[ternaryplot]{tpPar}}. If non-null, 
#'  \code{\link[base]{data.frame}} with 4 columns: \code{id}, and 
#'  3 other columns corresponding to \code{blrNames} in 
#'  \code{ternaryVariables}. If \code{NULL}, default 
#'  values will be used \code{getTpPar("vertices")}, and the 
#'  columns names changed to those of \code{ternaryVariables}.
#'
#'@param classes
#'  See \code{\link[ternaryplot]{tpPar}}.
#'
#'@param scale
#'  See \code{\link[ternaryplot]{tpPar}}. If non-null, 
#'  \code{\link[base]{data.frame}} with 3 columns, corresponding 
#'  to \code{blrNames} in \code{ternaryVariables}. If \code{NULL}, 
#'  default values will be used \code{getTpPar("scale")}, and the 
#'  columns names changed to those of \code{ternaryVariables}.
#'  NOT USED YET.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}
#'
#'
#'@example inst/examples/createTernarySystem-example.R
#'
#'
#'@rdname createTernarySystem
#'
#'@aliases ternarySystem
#'
#'@export
#'
createTernarySystem <- function(
 ternaryGeometry = NULL, 
 ternaryVariables = NULL, 
 main = character(0), 
 vertices = NULL, 
 classes = NULL, 
 scale = NULL, 
 ...
){  
    tsy <- list() 
    
    if( is.null( ternaryGeometry ) ){ 
        tsy[[ "ternaryGeometry" ]] <- createTernaryGeometry( ... )
    }else{ 
        tsy[[ "ternaryGeometry" ]] <- ternaryGeometry 
    }   
    
    if( is.null( ternaryVariables ) ){ 
        tsy[[ "ternaryVariables" ]] <- createTernaryVariables( ... )
    }else{ 
        tsy[[ "ternaryVariables" ]] <- ternaryVariables
    }   
    
    tsy[[ "main" ]] <- main
    
    
    #   Expected columns
    verticesDefault <- getTpPar( "vertices" ) 
    
    cn <- c( colnames(verticesDefault)[1], 
        tsy[[ "ternaryVariables" ]][[ "blrNames" ]] )
    
    if( is.null( vertices ) ){ 
        tsy[[ "vertices" ]] <- verticesDefault 
        
        colnames( tsy[[ "vertices" ]] ) <- cn
    }else{ 
        tsy[[ "vertices" ]] <- vertices 
    }   
    
    if( is.null( classes ) ){ 
        tsy[[ "classes" ]] <- getTpPar( "classes" ) 
    }else{ 
        tsy[[ "classes" ]] <- classes 
        
        cn2 <- colnames( getTpPar( "classes" ) ) 
    }   
    
    if( is.null( scale ) ){ 
        tsy[[ "scale" ]] <- getTpPar( "scale" ) 
        
        colnames( tsy[[ "scale" ]] ) <- cn[ -1 ]
    }else{ 
        tsy[[ "scale" ]] <- scale 
    }   
    
    
    #   Set class:
    class( tsy ) <- "ternarySystem"
    
    
    #   Check:
    ternaryCheck( tsy, ... ) 
    
    
    return( tsy ) 
}   

