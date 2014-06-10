
setwd( wd <- "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages/soiltexture/prepare/specialCharacters" )

    # source( file = "languages.R", encoding = "UTF-8" )

    # setwd( wd ) # just in case

    # source( file = "triangles.R", encoding = "UTF-8" )

library( "gtools" )

lan <- readLines( con = "languages.R", encoding = "UTF-8" ) 

lan2 <- ASCIIfy( x = lan, bytes = 2, fallback = "?")

writeLines( text = lan2, con = "languagesASCII.R" )


tri <- readLines( con = "triangles.R", encoding = "UTF-8" ) 

tri2 <- ASCIIfy( x = tri, bytes = 2, fallback = "?")

writeLines( text = tri2, con = "trianglesASCII.R" )

