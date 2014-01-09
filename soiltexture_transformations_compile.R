detach( package:soiltexture ) 
rm(list=ls(all=TRUE)) 



setwd( "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages/soiltexture/pkg/soiltexture/vignettes" ) 

Stangle( "transformations.Rnw" ) 

Sweave( "transformations.Rnw" ) 

for( clean in c(FALSE,FALSE,TRUE) ){ 
    msg <- tools::texi2dvi( 
        file        = "transformations.tex", 
        pdf         = TRUE, 
        clean       = clean, 
        texinputs   = getwd() 
    )   
    
    # if( !clean ){ 
    #     detach( package:soiltexture ) 
    # }   
}   


file.remove( list.files( file.path( work.wd, subdir1 ), "\\.R$", full.names = TRUE ) )

## Copy the vignette's pdf into the 'doc' folder
file.copy( 
    from      = "transformations.pdf", 
    to        = "../inst/doc/transformations.pdf", 
    overwrite = TRUE )    

# file.remove( "transformations.pdf" ) 



for( ext in c( "\\.tex$", "\\.bib.bak$", "\\.R$", "\\.aux$", 
    "\\.bbl$", "\\.blg$", "\\.log$", "\\.out$", "\\.toc$", "\\.pdf$" ) ){ 
    
    file.remove( list.files( getwd(), ext, full.names = TRUE ) ) 
}   


