
setwd( "D:/Users/julienm/Documents/_WORKS/_PROJECTS/r_packages/soiltexture/www" )

library( "markdown" )

markdownToHTML(
    file     = "index.md", 
    output   = "index.html", 
    title    = "soiltexture: The Soil Texture Wizard",
    encoding = "UTF-8" )
