
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



Using custom class-labels axis-labels for a pre-defined 
texture triangle
------------------------------------------------------------

Here is an example with the HYPRES texture triangle:

```
#   Fetch the definition of the HYPRES texture triangle
hypres <- soiltexture::TT.get( "HYPRES.TT" )

#   Inspect the object:
hypres
```

Here is the output returned by R (a list):

```
$`main`
[1] "HYPRES / European Soil Map"

$tt.points
   CLAY SILT SAND
1  1.00 0.00 0.00
2  0.60 0.00 0.40
3  0.60 0.40 0.00
4  0.35 0.00 0.65
5  0.35 0.50 0.15
6  0.35 0.65 0.00
7  0.18 0.00 0.82
8  0.18 0.17 0.65
9  0.00 0.00 1.00
10 0.00 0.35 0.65
11 0.00 0.85 0.15
12 0.00 1.00 0.00

$tt.polygons
$tt.polygons$`VF`
$tt.polygons$`VF`$`name`
[1] "Very fine"

$tt.polygons$`VF`$points
[1] 2 1 3


$tt.polygons$F
$tt.polygons$F$`name`
[1] "Fine"

$tt.polygons$F$points
[1] 4 2 3 6


$tt.polygons$M
$tt.polygons$M$`name`
[1] "Medium"

$tt.polygons$M$points
[1]  7  4  5 11 10  8


$tt.polygons$MF
$tt.polygons$MF$`name`
[1] "Medium fine"

$tt.polygons$MF$points
[1] 11  5  6 12


$tt.polygons$C
$tt.polygons$C$`name`
[1] "Coarse"

$tt.polygons$C$points
[1]  9  7  8 10



$blr.clock
[1] TRUE TRUE TRUE

$tlr.an
[1] 60 60 60

$blr.tx
[1] "SAND" "CLAY" "SILT"

$base.css.ps.lim
[1]    0    2   50 2000

$tri.css.ps.lim
[1]    0    2   50 2000

$unit.ps
bold(mu) * bold("m")

$unit.tx
bold("%")

$text.sum
[1] 100
```

The texture-triangle has the following class-labels: 
`C`, `M`, `MF`, `F`, `VF`.

Lets say you want to change that to: 
`c`, `m`, `mf`, `f`, `vf`.

Type the following code in R command prompt:

```
new.labels <- c( "C" = "c", "M" = "m", "MF" = "mf", 
    "F" = "f", "VF" = "vf" )
#   The pattern is c( "old_label" = "new_label", 
#       "old_label2" = "new_label2", ... )

#   fetch the old labels (for later control)
old.labels <- names( hypres[[ "tt.polygons" ]] ) 

#   Now replace the old labels by the new labels
names( hypres[[ "tt.polygons" ]] ) <- new.labels[ 
    names( hypres[[ "tt.polygons" ]] ) ]

#   We also change the main title of the triangle
hypres[[ "main" ]] <- "My texture triangle"
    
#   In the code below, the order in which you give the labels 
#   in principle does not matter, as long as each old label 
#   obtain a new label

#   Now control the old names and the new names:
data.frame( "old" = old.labels, 
    "new" = names( hypres[[ "tt.polygons" ]] ) )
```

It returns:

```
  old new
1  VF  vf
2   F   f
3   M   m
4  MF  mf
5   C   c
```

Finally, you need to save this modified texture triangle 
under a new name. Please notice that the new triangle will 
be usable until the end of the R cession, but the whole 
operation needs to be repeated for each new R cession. In the 
example below, I also show how to test the new triangle:

```
soiltexture::TT.add( "HYPRES2.TT" = hypres )
soiltexture::TT.plot( class.sys = "HYPRES2.TT" )
```

Now, it is also possible to change the axis labels (also 
when it needs to be displayed in another language):

```
soiltexture::TT.plot( class.sys = "HYPRES2.TT", 
    css.lab = c( "clay [%]", "silt [%]", "sand [%]" ), 
    main = "A texture triangle" )
```

You can't add twice the new triangle definition, at least not 
when using `TT.add()`. But you can either use 
`soiltexture::TT.set( "HYPRES2.TT" = hypres )` to overwrite 
the previous definition, or reset the package-parameters 
before using `TT.add()` again. The parameters can be reset 
by using `soiltexture::TT.set(reset=TRUE)`.
