# keep this

oldWd <- getwd() 
pkgName <- "soiltexture"
setwd( file.path( Sys.getenv(x = "rPackagesDir" ), pkgName, "pkg", pkgName, "inst" ) ) 

langPar2 <- data.frame( 
    "lang"  = c( "pl",                 "pt",                     "es2",                      "ro2"  ), 
    "CLAY"  = c( "\"I\u0142\"",             "\"Argila\"",             "\"Arcilla\"",              "\"Argil\u0103\"" ), 
    "SILT"  = c( "\"Py\u0142\"",            "\"Silte\"",              "\"Limo\"",                 "\"Praf\""), 
    "SAND"  = c( "\"Piasek\"",         "\"Areia\"",              "\"Arena\"",                "\"Nisip\""), 
    "TT"    = c( "\"Tr\u00f3jk\u0105t Fereta\"", "\"Tri\u00e2ngulo textural\"", "\"Tri\u00e1ngulo de textura\"", "\"Diagramei triunghiulare a texturii\"" ), 
    
    # pt: Tri\u00e2ngulo de classifica\u00e7\u00e3o textural de solos
    # es: Tri\u00e1ngulo de textura de suelos
    
    stringsAsFactors    = FALSE  
)   

saveRDS( object = langPar2, file = "languages.rds", ascii = FALSE)

setwd( oldWd )

