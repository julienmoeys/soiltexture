
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                   |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+



# blrNames ====================================================== 

#'Set or get the bottom-left-right axis names of a ternarySystem 
#'  object 
#'
#'Set or get the bottom-left-right axis names of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryVariables}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}.
#'
#'@param value 
#'  A vector of 3 character strings. Names of the 
#'  bottom-left-right axis.
#'
#' 
#'@rdname blrNames-methods
#'
#'@export 
#'
blrNames <- function( s, ... ){  
    UseMethod( "blrNames" ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames ternarySystem
#'
#'@export
#'
blrNames.ternarySystem <- function( s, ... ){  
    return( s[[ 'ternaryVariables']][[ 'blrNames' ]] ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames ternaryVariables
#'
#'@export
#'
blrNames.ternaryVariables <- function( s, ... ){  
    return( s[[ 'blrNames' ]] ) 
}   



# blrNames()<- ================================================== 

#'@rdname blrNames-methods
#'
#'@usage blrNames( s, ... ) <- value
#'
#'@export
#'
`blrNames<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "blrNames<-" ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames<- ternarySystem
#'
#'@export
#'
#'@usage \method{blrNames}{ternarySystem}(s, ...) <- value
#'
`blrNames<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryVariables']][[ 'blrNames' ]] <- value 
    
    # Change the column names in vertices
    vertices <- s[[ 'vertices' ]] 
    colnames( vertices ) <- c( colnames( vertices )[1], value )  
    s[[ 'vertices' ]] <- vertices 
    
    # Change the column names in scale
    scale <- s[[ 'scale' ]] 
    colnames( scale ) <- value 
    s[[ 'scale' ]] <- scale 
    
    ternaryCheck( s, ... )
    
    return( s ) 
}   



#'@rdname blrNames-methods
#'
#'@method blrNames<- ternaryVariables
#'
#'@export
#'
#'
#'@usage \method{blrNames}{ternaryVariables}(s, ...) <- value
#'
`blrNames<-.ternaryVariables` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'blrNames' ]] <- value 
        
    ternaryCheck( s, ... )
    
    return( s ) 
}   



# blrLabels ====================================================== 

#'Set or get the bottom-left-right axis labels of a ternarySystem 
#'  object 
#'
#'Set or get the bottom-left-right axis labels of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryVariables}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}.
#'
#'@param value 
#'  A vector of 3 character strings. Names of the 
#'  bottom-left-right axis.
#'
#' 
#'@rdname blrLabels-methods
#'
#'@export 
#'
blrLabels <- function( s, ... ){  
    UseMethod( "blrLabels" ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels ternarySystem
#'
#'@export
#'
blrLabels.ternarySystem <- function( s, ... ){  
    return( s[[ 'ternaryVariables']][[ 'blrLabels' ]] ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels ternaryVariables
#'
#'@export
#'
blrLabels.ternaryVariables <- function( s, ... ){  
    return( s[[ 'blrLabels' ]] ) 
}   



# blrLabels()<- ================================================== 

#'@rdname blrLabels-methods
#'
#'@usage blrLabels( s, ... ) <- value
#'
#'@export
#'
`blrLabels<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "blrLabels<-" ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels<- ternarySystem
#'
#'@export
#'
#'
#'@usage \method{blrLabels}{ternarySystem}(s, ...) <- value
#'
`blrLabels<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryVariables']][[ 'blrLabels' ]] <- value 
    
    ternaryCheck( s, ... )
    
    return( s ) 
}   



#'@rdname blrLabels-methods
#'
#'@method blrLabels<- ternaryVariables
#'
#'@export
#'
#'
#'@usage \method{blrLabels}{ternaryVariables}(s, ...) <- value
#'
`blrLabels<-.ternaryVariables` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'blrLabels' ]] <- value 
        
    ternaryCheck( s, ... )
    
    return( s ) 
}   



# blrClock ====================================================== 

#'Set or get the bottom-left-right orientation of a ternarySystem 
#'  object
#'
#'Set or get the bottom-left-right orientation of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#'@param \dots
#'  Additional parameters passed to \code{\link[ternaryplot]{ternaryCheck}}.
#'
#'@param value 
#'  A vector of 3 logical values. Bottom-left-right orientation of 
#'  a ternarySystem object.
#'
#' 
#'@rdname blrClock-methods
#'
#'@export 
#'
blrClock <- function( 
 s, 
 ... 
){  
    UseMethod( "blrClock" ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock ternarySystem
#'
#'@export
#'
blrClock.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]][[ 'blrClock' ]] ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock ternaryGeometry
#'
#'@export
#'
blrClock.ternaryGeometry <- function( 
 s, 
 ... 
){  
    return( s[[ 'blrClock' ]] ) 
}   



# blrClock()<- ================================================== 

#'@rdname blrClock-methods
#'
#'@usage blrClock( s, ... ) <- value
#'
#'@export
#'
`blrClock<-` <- function( 
 s, 
 ...,
 value 
){  
    UseMethod( "blrClock<-" ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock<- ternarySystem
#'
#'@export
#'
#'
#'@usage \method{blrClock}{ternarySystem}(s, ...) <- value
#'
`blrClock<-.ternarySystem` <- function( 
 s, 
 ...,
 value 
){  
    s[[ 'ternaryGeometry' ]][[ 'blrClock' ]] <- value 
    
    
    #   Set the class (in case it has changed)
    class( s[[ 'ternaryGeometry' ]] ) <- .generateTernaryGeometryClass( 
        blrClock = s[[ "blrClock" ]] ) 
    
    
    #   Check the validity
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... ) 

    
    return( s ) 
}   



#'@rdname blrClock-methods
#'
#'@method blrClock<- ternaryGeometry
#'
#'@export
#'
#'
#'@usage \method{blrClock}{ternaryGeometry}(s, ...) <- value
#'
`blrClock<-.ternaryGeometry` <- function( 
 s, 
 ...,
 value 
){  
    s[[ 'blrClock' ]] <- value 
    
    
    #   Set the class (in case it has changed)
    class( s ) <- .generateTernaryGeometryClass( 
        blrClock = s[[ "blrClock" ]] ) 
    
    
    ternaryCheck( s, ... ) 
    
    return( s ) 
}   



# fracSum ======================================================= 

#'Set or get the sum of the three fractions of a ternarySystem 
#'  object
#'
#'Set or get the sum of the three fractions of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  Single numerical value. Sum of the three fractions of the 
#'  ternarySystem.
#'
#' 
#'@rdname fracSum-methods
#'
#'@export 
#'
fracSum <- function( 
 s, 
 ... 
){  
    UseMethod( "fracSum" ) 
}   



#'@rdname fracSum-methods
#'
#'@method fracSum ternarySystem
#'
#'@export
#'
fracSum.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]][[ 'fracSum' ]] ) 
}   
 


#'@rdname fracSum-methods
#'
#'@method fracSum ternaryGeometry
#'
#'@export
#'
fracSum.ternaryGeometry <- function( 
 s, 
 ... 
){  
    return( s[[ 'fracSum' ]] ) 
}   



# fracSum()<- =================================================== 

#'@rdname fracSum-methods
#'
#'@usage fracSum( s, ... ) <- value
#'
#'@export
#'
`fracSum<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "fracSum<-" ) 
}   



#'@rdname fracSum-methods
#'
#'@method fracSum<- ternarySystem
#'
#'@export
#'
#'
#'@usage \method{fracSum}{ternarySystem}(s, ...) <- value
#'
`fracSum<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){ 
    s[[ 'ternaryGeometry' ]][[ 'fracSum' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... ) 
    
    return( s ) 
}   



#'@rdname fracSum-methods
#'
#'@method fracSum<- ternaryGeometry
#'
#'@export
#'
#'
#'@usage \method{fracSum}{ternaryGeometry}(s, ...) <- value
#'
`fracSum<-.ternaryGeometry` <- function( 
 s, 
 ..., 
 value 
){ 
    s[[ 'fracSum' ]] <- value 
    
    ternaryCheck( s, ... ) 
    
    return( s ) 
}   



# tlrAngles ===================================================== 

#'Set or get the top, left and right angles of a ternary system 
#'  object
#'
#'Set or get the top, left and right angles of a 
#'  \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}, or a 
#'  \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  Vector of three numerical values, summing to 180. Top, left 
#'  and right angles of the ternary system object.
#'
#' 
#'@rdname tlrAngles-methods
#'
#'@export 
#'
tlrAngles <- function( 
 s, 
 ... 
){  
    UseMethod( "tlrAngles" ) 
}   



#'@rdname tlrAngles-methods
#'
#'@method tlrAngles ternarySystem
#'
#'@export
#'
tlrAngles.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]][[ 'tlrAngles' ]] ) 
}   



#'@rdname tlrAngles-methods
#'
#'@method tlrAngles ternaryGeometry
#'
#'@export
#'
tlrAngles.ternaryGeometry <- function( 
 s, 
 ... 
){  
    return( s[[ 'tlrAngles' ]] ) 
}   



# tlrAngles()<- ================================================= 

#'@rdname tlrAngles-methods
#'
#'@usage tlrAngles( s, ... ) <- value 
#'
#'@export
#'
`tlrAngles<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "tlrAngles<-" ) 
}   
 


#'@rdname tlrAngles-methods
#'
#'@method tlrAngles<- ternarySystem
#'
#'@export
#'
#'
#'@usage \method{tlrAngles}{ternarySystem}(s, ...) <- value
#'
`tlrAngles<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryGeometry' ]][[ 'tlrAngles' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... )     
    
    return( s ) 
}   



#'@rdname tlrAngles-methods
#'
#'@method tlrAngles<- ternaryGeometry
#'
#'@export
#'
#'
#'@usage \method{tlrAngles}{ternaryGeometry}(s, ...) <- value
#'
`tlrAngles<-.ternaryGeometry` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'tlrAngles' ]] <- value 
    
    ternaryCheck( s, ... )     
    
    return( s ) 
}   



# ternaryGeometry ===================================================== 

#'Set or get the ternaryGeometry of a ternarySystem object
#'
#'Set or get the ternaryGeometry of a \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  A \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#' 
#'@rdname ternaryGeometry-methods
#'
#'@export 
#'
ternaryGeometry <- function( 
 s, 
 ... 
){  
    UseMethod( "ternaryGeometry" ) 
}   



#'@rdname ternaryGeometry-methods
#'
#'@method ternaryGeometry ternarySystem
#'
#'@export
#'
ternaryGeometry.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryGeometry' ]] ) 
}   



# ternaryGeometry()<- =========================================== 

#'@rdname tlrAngles-methods
#'
#'@usage ternaryGeometry( s, ... ) <- value
#'
#'@export
#'
`ternaryGeometry<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "ternaryGeometry<-" ) 
}   
 


#'@rdname ternaryGeometry-methods
#'
#'@method ternaryGeometry<- ternarySystem
#'
#'@export
#'
#'
#'@usage \method{ternaryGeometry}{ternarySystem}( s, ... ) <- value
#'
`ternaryGeometry<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryGeometry' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryGeometry' ]], ... )     
    
    return( s ) 
}   



# print.ternaryGeometry ========================================= 

#'Print the content of a ternaryGeometry object in a human readable format.
#'
#'Print the content of a \code{ternaryGeometry} object 
#'  (S3-class) in a human readable format.
#'
#'
#'@param x 
#'  A \code{ternaryGeometry} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryGeometry}}.
#'
#'@param prefix 
#'  Single character string. Prefix used before the different 
#'  items in \code{x} (intended for internal use, for example 
#'  \code{prefix = "$ternaryGeometry"}).
#'
#'@param collapse 
#'  Single character string. Passed to 
#'  \code{\link{paste}( ..., collapse )} when displaying the 
#'  items' values.
#'
#'@param \dots
#'  Additional parameters passed to specific methods (not 
#'  used). 
#'
#'
#'@method print ternaryGeometry
#'
#'@export
#'
print.ternaryGeometry <- function( 
 x, 
 prefix = "", 
 collapse = "; ", 
 ... 
){  
    cat( "A ternaryGeometry (S3-class) object:\n\n" )
    
    cat( sprintf( 
        "%s$tlrAngles: %s\n", 
        prefix, 
        paste( as.character( x[[ "tlrAngles" ]] ), collapse = collapse ) 
    ) ) 
    
    cat( "  Angles of the top, left and right vertices [degrees]\n" )
    cat( "  Get or set with tlrAngles() or tlrAngles() <- value\n\n" )
    
    clock <- as.character( x[[ "blrClock" ]] )
    clock[ is.na( clock ) ] <- "NA" 
    
    cat( sprintf( 
        "%s$blrClock: %s\n", 
        prefix, 
        paste( clock, collapse = collapse ) 
    ) ) 
    
    cat( "  Directions of the bottom, left and right axis (edges)\n" )
    cat( "  TRUE is clockwise (CW), FALSE is counter-CW and NA is centripetal\n" )
    cat( "  Get or set with blrClock() or blrClock() <- value\n\n" )
    
    cat( sprintf( 
        "%s$fracSum: %s\n", 
        prefix, 
        x[[ "fracSum" ]] 
    ) ) 
    
    cat( "  Sum of the 3 variables in the diagram\n" )
    cat( "  1 for fractions, 100 for percentages\n" )
    cat( "  Get or set with fracSum() or fracSum() <- value\n\n" )
    
    return( invisible( x ) ) 
}   



# ternaryVariables ============================================== 

#'Set or get the ternaryVariables of a ternarySystem object.
#'
#'Set or get the ternaryVariables of a \code{ternarySystem} object.
#'
#'
#'@param s 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}.
#'
#'@param \dots
#'  Additional parameters passed to specific methods.
#'
#'@param value
#'  A \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryVariables}}.
#'
#' 
#'@rdname ternaryVariables-methods
#'
#'@export 
#'
ternaryVariables <- function( 
 s, 
 ... 
){  
    UseMethod( "ternaryVariables" ) 
}   



#'@rdname ternaryVariables-methods
#'
#'@method ternaryVariables ternarySystem
#'
#'@export
#'
ternaryVariables.ternarySystem <- function( 
 s, 
 ... 
){  
    return( s[[ 'ternaryVariables' ]] ) 
}   



# ternaryVariables()<- ========================================== 

#'@rdname ternaryVariables-methods
#'
#'@usage ternaryVariables( s, ... ) <- value 
#'
#'@export
#'
`ternaryVariables<-` <- function( 
 s, 
 ..., 
 value 
){  
    UseMethod( "ternaryVariables<-" ) 
}   
 


#'@rdname ternaryVariables-methods
#'
#'@method ternaryVariables<- ternarySystem
#'
#'@export
#'
#'
#'@usage \method{ternaryVariables}{ternarySystem}( s, ... ) <- value
#'
`ternaryVariables<-.ternarySystem` <- function( 
 s, 
 ..., 
 value 
){  
    s[[ 'ternaryVariables' ]] <- value 
    
    ternaryCheck( s[[ 'ternaryVariables' ]], ... )     
    
    return( s ) 
}   



# print.ternaryVariables ========================================= 

#'Print the content of a ternaryVariables object in a human readable format.
#'
#'Print the content of a \code{ternaryVariables} object 
#'  (S3-class) in a human readable format.
#'
#'
#'@param x 
#'  A \code{ternaryVariables} object, as created with 
#'  \code{\link[ternaryplot]{createTernaryVariables}}.
#'
#'@param prefix 
#'  Single character string. Prefix used before the different 
#'  items in \code{x} (intended for internal use, for example 
#'  \code{prefix = "$ternaryGeometry"}).
#'
#'@param collapse 
#'  Single character string. Passed to 
#'  \code{\link{paste}( ..., collapse )} when displaying the 
#'  items' values.
#'
#'@param \dots
#'  Additional parameters passed to specific methods (not 
#'  used).
#'
#'@export 
#'
#'@method print ternaryVariables
#' 
print.ternaryVariables <- function( 
 x, 
 prefix = "", 
 collapse = "; ", 
 ... 
){  
    cat( "A ternaryVariables (S3-class) object:\n\n" )
    
    cat( sprintf( 
        "%s$blrNames: %s\n", 
        prefix, 
        paste( x[[ "blrNames" ]], collapse = collapse ) 
    ) ) 
    
    cat( "  Names of the bottom, left and right variables\n" ) 
    cat( "  Get or set with blrNames() and blrNames() <- value\n\n" ) 
    
    cat( sprintf( 
        "%s$blrLabels: %s\n", 
        prefix, 
        paste( x[[ "blrLabels" ]], collapse = collapse ) 
    ) ) 
    
    cat( "  Labels of the bottom, left and right axis\n" ) 
    cat( "  Get or set with blrLabels() and blrLabels() <- value\n\n" ) 
    
    return( invisible( x ) ) 
}   



# print.ternarySystem ====================================== 

#'Print the content of a ternarySystem object in a human readable format.
#'
#'Print the content of a \code{ternarySystem} object 
#'  (S3-class) in a human readable format.
#'
#'
#'@param x 
#'  A \code{ternarySystem} object, as created with 
#'  \code{\link[ternaryplot]{createTernarySystem}}.
#'
#'@param prefix 
#'  Single character string. Prefix used before the different 
#'  items in \code{x} (intended for internal use, for example 
#'  \code{prefix = "$ternaryGeometry"}).
#'
#'@param collapse 
#'  Single character string. Passed to 
#'  \code{\link{paste}( ..., collapse )} when displaying the 
#'  items' values.
#'
#'@param \dots
#'  Additional parameters passed to specific methods (not 
#'  used).
#'
#'@export 
#'
#'@method print ternarySystem
#' 
print.ternarySystem <- function( 
 x, 
 prefix = "", 
 collapse = "; ", 
 ... 
){  
    cat( "A ternarySystem (S3-class) object:\n\n" )
    
    cat( "$ternaryVariables\n" ) 
    
    print( 
        x        = x[[ "ternaryVariables" ]], 
        prefix   = paste0( prefix, "$ternaryVariables" ), 
        collapse = collapse, 
        ... 
    )   
    
    cat( "$ternaryGeometry\n" ) 
    
    print( 
        x        = x[[ "ternaryGeometry" ]], 
        prefix   = paste0( prefix, "$ternaryGeometry" ), 
        collapse = collapse, 
        ... 
    )   
    
    cat( sprintf( "%s$main: %s\n", prefix, x[[ "main" ]] ) ) 
    cat( "  Default title of the ternary diagram\n\n" ) 
    
    cat( sprintf( "%s$vertices:\n", prefix ) ) 
    print( x[[ "vertices" ]] ) 
    cat( "  A data.frame containing the vertices identifiers and positions\n" ) 
    cat( "  Empty for a ternary-system with no classes\n" ) 
    cat( "  Can not be altered independently from $classes\n" ) 
    cat( "  Use createTernarySystem() to modify them\n\n" ) 
    
    cat( sprintf( "%s$classes:\n", prefix ) ) 
    print( x[[ "classes" ]] ) 
    cat( "  A data.frame containing the classes' abbreviations,\n" ) 
    cat( "  names and lists of vertices\n" )
    cat( "  Empty for a ternary-system with no classes\n" ) 
    cat( "  Can not be altered independently from $vertices\n" ) 
    cat( "  Use createTernarySystem() to modify them\n\n" ) 
    
    cat( sprintf( "%s$scale:\n", prefix ) ) 
    print( x[[ "scale" ]] ) 
    cat( "  A data.frame containing the min and max limits (rows)\n" ) 
    cat( "  of each axis (columns)\n" ) 
    cat( "  Currently not used (zoom feature not implemented)\n\n" ) 
    
    return( invisible( x ) ) 
}   


