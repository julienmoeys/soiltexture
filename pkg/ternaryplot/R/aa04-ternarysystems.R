
# +-------------------------------------------------------------+
# | Package:    ternaryplot                                   |
# | Language:   R + roxygen2 inline documentation               |
# | Author(s):  Julien Moeys <Julien.Moeys@@slu.se>             |
# | License:    AGPL3, Affero General Public License version 3  |
# +-------------------------------------------------------------+



# ternarySystemEnv ==============================================

# New environment that will contain the definition of a few 
#   ternary classification systems
ternarySystemEnv  <- new.env() 


# Default, empty, ternary classification:
ternarySystemEnv[[ "default" ]] <- createTernarySystem() 



# Dummy ternary classification:
ternarySystemEnv[[ "dummy" ]] <- createTernarySystem( 
    "ternaryGeometry"   = createTernaryGeometry(),  
    "main"              = "Ternary plot (dummy)", 
    "vertices"          = data.frame( 
        "id"    = c(  1,   2,   3,   4), 
        "F1"    = c(000, 000, 050, 100), 
        "F2"    = c(100, 000, 000, 000), 
        "F3"    = c(000, 100, 050, 000)  
    ),  
    "classes"           = data.frame( 
        "abbrev" = c( 
            "C1", 
            "C2" ), 
        "name" = c( 
            "Class 1", 
            "Class 2" ),  
        "verticesId" = I( list( # The length of each item can vary
            "C1" = c( 1, 2, 3 ), 
            "C2" = c( 3, 2, 4 ) 
        ) ),
        stringsAsFactors = FALSE 
    ),  
    "scale"             = NULL
)     



# HYPRES / EU Soil Map texture triangle
ternarySystemEnv[[ "hypres" ]] <- createTernarySystem( 
    
    # Info from SysCan "FAO Soil Texture" (in fact, not an FAO soil texture!)
    # http://sis.agr.gc.ca/cansis/nsdb/lpdb/faotext.html
    # 
    # <quote>
    # >> Texture is the relative proportion of sand, silt and clay of the dominant 
    # >> soil for each soil map polygon. Texture classes are:
    # 
    # >> Coarse texture: sands, loamy sand and sandy loams with less than 18 % clay, 
    # >> and more than 65 % sand.
    #
    # >> Medium texture: sandy loams, loams, sandy clay loams, silt loams with less 
    # >> than 35 % clay and less than 65 % sand; the sand fractions may be as high as 82 % if a minimum of 18 % clay is present.
    #
    # >> Fine texture: clays, silty clays, sandy clays, clay loams and silty clay loams 
    # >> with more than 35 % clay.
    #
    # >> Where two or three texture names appear, this means that all named textures 
    # >> are present in the map unit.
    # 
    # >> Texture Codeset
    # >> COARSE
    # >> FINE
    # >> FINE-COARSE
    # >> FINE-MED-CRS
    # >> FINE-MEDIUM
    # >> MEDIUM
    # >> MEDIUM-COARSE
    # </quote>
    
    "ternaryVariables" = createTernaryVariables( 
        "blrNames"  = c( "SAND", "CLAY", "SILT" ), 
        "blrLabels" = expression( 
            'Sand 50-2000' ~ mu * 'm [%]', 
            'Clay 0-2' ~ mu * 'm [%]', 
            'CSilt 2-50' ~ mu * 'm [%]'
        )   
    ),  
    
    "ternaryGeometry" = createTernaryGeometry( 
        "tlrAngles" = c( 60, 60, 60 ), 
        "blrClock"  = rep( TRUE, 3 ), 
        "fracSum"   = 100 
    ), 
    
    "main" = "HYPRES / EU Soil Map texture triangle", 
    
    "vertices" = data.frame( 
        "id"    = c(   1,   2,   3,   4,   5,   6,   7,   8,   9,  10,  11,  12 ), 
        "CLAY"  = c( 100, 060, 060, 035, 035, 035, 018, 018, 000, 000, 000, 000 ), 
        "SILT"  = c( 000, 000, 040, 000, 050, 065, 000, 017, 000, 035, 085, 100 ), 
        "SAND"  = c( 000, 040, 000, 065, 015, 000, 082, 065, 100, 065, 015, 000 )   
    ),  
    
    "classes" = data.frame( 
        "abbrev" = c( "VF", "F", "M", "MF", "C" ), 
        "name" = c( 
            "Very fine", 
            "Fine", 
            "Medium", 
            "Medium fine", 
            "Coarse" ), 
        "verticesId" = I( list( 
            c(02,01,03), 
            c(04,02,03,06), 
            c(07,04,05,11,10,08), 
            c(11,05,06,12), 
            c(09,07,08,10) 
        ) ), 
        stringsAsFactors = FALSE 
    ),  
    
    "scale" = NULL 
)   



# getTernarySystem ==============================================

#'Fetch a pre-defined ternary classification system
#'
#'Fetch a pre-defined ternary classification system
#'
#'
#'@param s 
#'  Single character string. Name of the ternary classification to 
#'  be fetched.
#'
#'
#'@return 
#'  A \code{ternarySystem} object.
#'
#'
#'@export 
#'
getTernarySystem <- function( s = "default" ){    
    if( !is.character( s ) ){ 
        stop( "'s' must be a character string" )
    }   
    
    # Get all the ternary classifications:
    # listTernarySystem <- as.list( "ternaryplot":::"listTernarySystem" ) 
    ternarySystemE <- as.list( ternarySystemEnv )  
    
    # Check if the system asked is present:
    if( s %in% names( ternarySystemE ) ){ 
        s <- ternarySystemE[[ s ]] 
    }else{ 
        stop( sprintf( 
            "The ternary plot (%s) could not be found", 
            s 
        ) ) 
    }   
    
    return( s ) 
}   



# listTernarySystem ==============================================

#'List all pre-defined ternary classification systems
#'
#'List all pre-defined ternary classification systems
#'
#'
#'@return 
#'  A vector of character strings, names of the pre-defined ternary 
#'  classification systems
#'
#'
#'@export 
#'
listTernarySystem <- function(){    
    # Get all the ternary classifications:
    ternarySystemE <- as.list( ternarySystemEnv ) 
    
    tsList <- names( ternarySystemE )
    
    return( tsList ) 
}   

