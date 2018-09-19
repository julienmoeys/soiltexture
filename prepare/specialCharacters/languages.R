# keep this

oldWd <- getwd() 
pkgName <- "soiltexture"
setwd( file.path( Sys.getenv(x = "rPackagesDir" ), pkgName, "pkg", pkgName, "inst" ) ) 

langPar2 <- data.frame( 
    "lang"  = c( "pl",                 "pt",                     "es2",                      "ro2"  ), 
    "CLAY"  = c( "\"Ił\"",             "\"Argila\"",             "\"Arcilla\"",              "\"Argilă\"" ), 
    "SILT"  = c( "\"Pył\"",            "\"Silte\"",              "\"Limo\"",                 "\"Praf\""), 
    "SAND"  = c( "\"Piasek\"",         "\"Areia\"",              "\"Arena\"",                "\"Nisip\""), 
    "TT"    = c( "\"Trójkąt Fereta\"", "\"Triângulo textural\"", "\"Triángulo de textura\"", "\"Diagramei triunghiulare a texturii\"" ), 
    
    # pt: Triângulo de classificação textural de solos
    # es: Triángulo de textura de suelos
    
    stringsAsFactors    = FALSE  
)   

saveRDS( object = langPar2, file = "languages.rds", ascii = FALSE)

setwd( oldWd )

