
soiltexture package - Frequently asked questions (FAQ)
============================================================

I list below the answer to some questions that are likely to 
be useful to other users of the `soiltexture` package.



Graph customisation
============================================================

Using category-specific colours or symbols when plotting points 
on the texture triangle
------------------------------------------------------------

```
# dummy texture dataset 
my.text <- data.frame( 
    "CLAY"  = c(05,60,15,05,25,05,25,45,65,75,13,47), 
    "SILT"  = c(05,08,15,25,55,85,65,45,15,15,17,43), 
    "SAND"  = c(90,32,70,70,20,10,10,10,20,10,70,10), 
    "OC"    = c(20,14,15,05,12,15,07,21,25,30,05,28), 
    "site"  = c( 5, 5, 5, 5, 6, 6, 6, 6, 9, 9, 9, 9) ) 

#   List of categories
cat_list <- unique( my.text[, "site" ] )
    
#   Attribute one colour per site
col_list <- rainbow( n = length( cat_list ), 
    s = 0.8, v = 0.8 )
#   Add names to the colour list
names( col_list ) <- as.character( cat_list )

#   Attribute one symbol (pch) per site
pch_list <- 1:length( cat_list )
#   Add names to the symbol list
names( pch_list ) <- as.character( cat_list )

# :: And plot it, with one color per site
soiltexture::TT.plot( 
    class.sys = "USDA-NCSS.TT", 
    tri.data  = my.text, 
    main      = "Soil texture data, per site", 
    col       = col_list[ as.character( my.text[, "site" ] ) ], 
    pch       = pch_list[ as.character( my.text[, "site" ] ) ] ) 
    
legend( 
    x       = "topleft", 
    title   = "Site:", 
    legend  = cat_list, 
    pch     = pch_list, 
    col     = col_list, 
    pt.lwd  = 2, 
    bty     = "n" )
```
