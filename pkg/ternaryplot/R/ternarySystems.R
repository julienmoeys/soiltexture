# New environment that will contain the definition of a few 
#   ternary classification systems
ternarySystemEnv  <- new.env() 


# Default, empty, ternary classification:
ternarySystemEnv[[ "default" ]] <- new( "ternarySystem" ) 




# Dummy ternary classification:
ternarySystemEnv[[ "dummy" ]] <- new( 
    "ternarySystem", 

    "ternaryGeometry" = new( "ternaryGeometry" ),  

    "main" = "Ternary plot (dummy)", 

    "vertices" = data.frame( 
        "id"    = c(  1,   2,   3,   4), 
        "F1"    = c(000, 000, 050, 100), 
        "F2"    = c(100, 000, 000, 000), 
        "F3"    = c(000, 100, 050, 000)  
    ),  

    "classes" = data.frame( 
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

    "scale" = data.frame( 
        "F1" = c( 000, 100 ),  
        "F2" = c( 000, 100 ),  
        "F3" = c( 000, 100 ), 
        row.names = c( "min", "max" ) 
    )   
)     




# HYPRES / EU Soil Map texture triangle
ternarySystemEnv[[ "HYPRES" ]] <- new( 
    "ternarySystem", 
    
    "ternaryVariables" = new( 
        "ternaryVariables", 
        "blrNames"  = c( "SAND", "CLAY", "SILT" ), 
        "blrLabels" = expression( 
            'Sand 50-2000' ~ mu * 'm [%]', 
            'Clay 0-2' ~ mu * 'm [%]', 
            'CSilt 2-50' ~ mu * 'm [%]'
        )   
    ),  
    
    "ternaryGeometry" = new( 
        "ternaryGeometry", 
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

    "scale" = data.frame( 
        "SAND" = c( 000, 100 ),  
        "SILT" = c( 000, 100 ),  
        "CLAY" = c( 000, 100 ), 
        row.names = c( "min", "max" ) 
    )    
)   

# In fact it is the FAO soil texture classes: Info from SysCan
# http://sis.agr.gc.ca/cansis/nsdb/lpdb/faotext.html
# FAO Soil Texture
# Texture is the relative proportion of sand, silt and clay of the dominant 
# soil for each soil map polygon. Texture classes are:
#
# Coarse texture: sands, loamy sand and sandy loams with less than 18 % clay, 
# and more than 65 % sand.
#
# Medium texture: sandy loams, loams, sandy clay loams, silt loams with less 
# than 35 % clay and less than 65 % sand; the sand fractions may be as high as 82 % if a minimum of 18 % clay is present.
#
# Fine texture: clays, silty clays, sandy clays, clay loams and silty clay loams 
# with more than 35 % clay.
#
# Where two or three texture names appear, this means that all named textures 
# are present in the map unit.
# 
# Texture Codeset
# COARSE
# FINE
# FINE-COARSE
# FINE-MED-CRS
# FINE-MEDIUM
# MEDIUM
# MEDIUM-COARSE

