
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                     |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+



# createTernaryGrid =============================================

#'Create a regular ternary grid. Base frame for binning ternary data.
#'
#'Create a regular ternary grid. Base frame for binning ternary data.
#'
#'
#'@param s 
#'  Either a single character string, or a \code{ternarySystem} 
#'  object, as obtained from \code{\link[ternaryplot]{getTernarySystem}}
#'
#'@param n
#'  Single integer value. Number of intervals
#'
#'@param \dots 
#'  Additional parameters passed to specific methods.
#'
#'
#'@return 
#'  A ternary grid (of polygons), with class \code{ternaryPolygons}.
#'
#'
#'@rdname createTernaryGrid-methods
#'
#'@export 
#'
createTernaryGrid <- function(
 s, 
 ... 
){  
    if( missing( s ) ){ 
        UseMethod( "createTernaryGrid", object = character(0) ) 
    }else{ 
        UseMethod( "createTernaryGrid" ) 
    }   
}   



#'@rdname createTernaryGrid-methods
#'
#'@method createTernaryGrid character
#'
#'@export
#'
createTernaryGrid.character <- function(
 s, # A ternarySystem
 ... 
){  
    if( missing(s) ){ 
        s <- getTernarySystem() 
    }else{ 
        s <- getTernarySystem( s = s ) 
    }   
    
    createTernaryGrid( s = s, ... )
}   



#'@rdname createTernaryGrid-methods
#'
#'@method createTernaryGrid ternarySystem
#'
#'@export
#'
createTernaryGrid.ternarySystem <- function(
 s,         # A ternarySystem
 n = 10,    # number of intervals
 ... 
){  
    x <- y <- seq( from = 0, to = 1, length.out = n ) 
    
    empty <- data.frame( "id" = character(0), "x" = numeric(0), 
        "y" = numeric(0), "z" = numeric(0), stringsAsFactors = FALSE )
    
    grd <- lapply( 
        X   = 1:(length(x)-1), 
        FUN = function(i){ 
            grd <- lapply( 
                X   = 1:(length(x)-1), 
                FUN = function(j){ 
                    # i <- 3; j <- 2
                    
                    df1 <- cbind( 
                        "x" = x[ c( i, i+1, i,   i, i ) ], 
                        "y" = x[ c( j, j,   j+1, j, j ) ] 
                    )   
                    
                    rs1 <- rowSums( df1 )
                    
                    if( any( rs1 > 1 ) ){ # any( !is.na( over( df1, triangleFrame ) ) )
                        df1 <- empty
                    }else{ 
                        df1 <- data.frame( "id" = paste( i, j, 1, sep = ":" ), 
                            df1, "z" = 1 - rs1, stringsAsFactors = FALSE ) 
                    };  rm( rs1 ) 
                    
                    
                    df2 <- cbind( 
                        "x" = x[ c( i+1, i+1, i,   i+1, i+1 ) ], 
                        "y" = x[ c( j,   j+1, j+1, j,   j   ) ] 
                    )   
                    
                    rs2 <- rowSums( df2 )
                    
                    if( any( rs2 > 1 ) ){ # any( !is.na( over( df2, triangleFrame ) ) )
                        df2 <- empty
                    }else{ 
                        df2 <- data.frame( "id" = paste( i, j, 2, sep = ":" ), 
                            df2, "z" = 1 - rs2, stringsAsFactors = FALSE ) 
                    };  rm( rs2 ) 
                    
                    
                    
                    return( rbind( df1, df2 ) ) 
                }   
            )   
            
            grd <- do.call( "what" = "rbind", args = grd )
        }   
    )   
    
    grd <- do.call( "what" = "rbind", args = grd )
    
    colnames( grd ) <- c( "id", blrNames( s ) ) 
    
    grd <- list( 
        "grid"          = grd, 
        "ternarySystem" = s 
    )   
    
    class( grd ) <- "ternaryPolygons" 
    
    return( grd )
}   



# ternary2SpatialPolygonsDataFrame ==============================

#'Converts ternary*-class objects to SpatialPolygonsDataFrame
#'
#'Converts ternary*-class objects to \code{\link[sp]{SpatialPolygonsDataFrame}}
#'
#'
#'@param x 
#'  A ternary*-class object.
#'
#'@param \dots 
#'  Additional parameters passed to specific methods.
#'
#'
#'@return 
#'  A \code{\link[sp]{SpatialPolygonsDataFrame}}
#'
#'
#'@rdname ternary2SpatialPolygonsDataFrame-methods
#'
#'@export 
#'
ternary2SpatialPolygonsDataFrame <- function(
 x, 
 ... 
){  
    UseMethod( "ternary2SpatialPolygonsDataFrame" ) 
}   



#'@rdname ternary2SpatialPolygonsDataFrame-methods
#'
#'@method ternary2SpatialPolygonsDataFrame ternaryPolygons
#'
#'@export
#'
#'
#'@usage \method{ternary2SpatialPolygonsDataFrame}{ternaryPolygons}( x, ... ) 
#'
#'@importFrom sp Polygons 
#'@importFrom sp Polygon 
#'@importFrom sp SpatialPolygons 
#'@importFrom sp SpatialPolygonsDataFrame 
ternary2SpatialPolygonsDataFrame.ternaryPolygons <- function(
 x, 
 ... 
){  
    s  <- x[[ "ternarySystem" ]] 
    x  <- x[[ "grid" ]] 
    x  <- x[ order( x[, "id"] ), ] 
    id <- x[, "id" ] 
    x <- subset( x, select = eval( quote( -id ) ) )
    
    .blrNames <- blrNames( s ) 
    
    #   Transform from Top-Left-Right to X-Y
    xy <- ternary2xy( s = s, x = x[, .blrNames ] ) 
    
    xy  <- split( x = xy, f = as.factor( id ) ) 
    nxy <- names( xy ) 
    
    # browser()
    
    pxy <- lapply( 
        X   = 1:length( xy ), 
        FUN = function(X){ 
            sp::Polygons( srl = list( sp::Polygon( coords = xy[[ X ]] ) ), 
                ID = nxy[ X ] )
        }   
    )   
    # pxy <- do.call( "what" = "rbind", "args" = pxy )
    
    
    #   Aggregate x
    #   TO DO: replace this by centroid calculation + xy2ternary() 
    
    x <- aggregate( x, by = list( "ID" = id ), FUN = mean ) 
    rownames( x ) <- x[, "ID" ] 
    x <- subset( x, select = eval( quote( -ID ) ) )
    
    # pxy <- Polygons( srl = pxy, ID = nxy ) 
    pxy <- sp::SpatialPolygons( Srl = pxy )
    pxy <- sp::SpatialPolygonsDataFrame( Sr = pxy, data = x, match.ID = FALSE )
    
    return( pxy ) 
}   

    # tg <- createTernaryGrid("default")
    # library( "sp" ) 
    # tgSp <- ternary2SpatialPolygonsDataFrame( tg )
    
    # plot( tgSp ) 

