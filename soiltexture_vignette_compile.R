# Running the latest part of this script (zipMe) requires to have 
# 7zip installed and available on Windows path.
rm(list=ls(all=TRUE)) 
work.wd             <- "C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/pkg/soiltexture/inst/doc"  
Sweave.wrapper.fun  <- "C:/_RTOOLS/SWEAVE_WORK/SOIL_TEXTURES/rforge/Sweave_wrapper.R" 
file.name.root      <- "soiltexture_vignette"  
sweave.ext          <- ".Rnw"  
inout.dir           <- ""  



eval( parse( Sweave.wrapper.fun ) ) 



res <- Sweave.wrapper( 
    file.name.root  = file.name.root, 
    work.wd         = work.wd, 
    inout.dir       = inout.dir 
)   #



### If LaTeX failed because the pdf file was open, run:
# res <- texi2dvi.wrapper( 
#     file.name.root  = file.name.root, 
#     work.wd         = work.wd, 
#     inout.dir       = inout.dir 
# )   #



# if( res ) 
# {   #
#     zipMe( 
#         file.name = paste(sep="",file.name.root,".pdf"), 
#         file.dir  = work.wd  
#     )   #
# }else{ 
#     print( "Files not zipped" ) 
# }   #



