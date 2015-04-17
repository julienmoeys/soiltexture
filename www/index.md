soiltexture: Functions for Soil Texture Plot, Classification and Transformation
===============================================================================

![USDA Soil Texture Triangle](USDA_texture_triangle.png)

_The Soil Texture Wizard_

Page content: 
[In short](#inshort) | 
[Introduction](#intro) | 
[Installation](#installation) | 
[Text based graphical user interface](#text_gui) | 
[List of classification systems implemented](#classif_systems) | 
[Acknowledgements (contributors)](#acknowledgements) | 
[Other works and software on soil textures (triangles)](#other_works) | 
[Articles related to soil texture triangles or systems](#articles) | 
[See also (other R projects)](#seealso) 

Last update: 2015/04/17

In short    <a id="inshort"></a>
--------

*   Author: **[Julien Moeys][julienmoeys]** ([SLU][]/[CKB][]).
*   Package on CRAN: http://cran.r-project.org/web/packages/soiltexture/index.html 
*   Project page on R-forge: http://r-forge.r-project.org/projects/soiltexture/ 
*   Code Repository (R-forge): http://r-forge.r-project.org/scm/?group_id=740 
*   Comprehensive tutorial (_package vignette_): http://cran.r-project.org/web/packages/soiltexture/vignettes/soiltexture_vignette.pdf 
*   Frequently Asked Questions: [FAQ](FAQ.html) (_under construction_)
*   On-line documentation: http://docs.julienmoeys.info/soiltexture/ 



Introduction    <a id="intro"></a>
------------

`soiltexture` is a [package][R_packages] (_extension_) for 
the [R][], a _free software environment for statistical_ 
_computing and graphics_.

`soiltexture` is a toolbox for plotting, classifying and 
transforming [soil texture][soil_texture] data (clay, 
silt and sand contents).

Soil texture data and soil [texture classifications systems][texture_classif] 
are traditionally visualised (plotted) on [ternary diagrams][ternary_plot]  
(called texture plots, texture diagrams or texture triangles).

`soiltexture` currently implements **17** soil texture 
classification systems from all around the world. See 
[here][triangle_gallery] for a gallery of available texture 
triangles, and see also the package vignette (_after 
[installing](#installation) the package_):

    vignette( "soiltexture_vignette" )

See [above](#inshort) for an on-line version of this vignette 
/ tutorial.



Installation    <a id="installation"></a>
============

Install R
---------

You need to install beforehand the sofware [R][] ("_a free_ 
_software environment for statistical computing and graphics_").

From R homepage, go to the [CRAN homepage][CRAN] or (_better_) choose 
the nearest [CRAN mirror][CRAN_mirrors].

From there, choose 'Download R for ...' (Windows, Mac or Linux), 
and then choose 'base' or 'install R for the First time'.

From there (latest stable R release), download the software 
installation files (if you are running on Windows) and install 
the program on your computer (follow the instructions from the 
installer). 

Note: Unless you know what you are doing, it is recommended 
to install the latest R release (it may not always be possible 
to install the package `soiltexture` on older versions of R, 
or some of the latest features might be missing).



Install soiltexture (stable release)
------------------------------------

Open R, and type the command:

    install.packages( "soiltexture" ) 



Install soiltexture (development version)
-----------------------------------------

Note: This will only work with the latest (stable) version 
of R. You should also check on the package R-forge page 
(here: http://r-forge.r-project.org/R/?group_id=740) that 
the "Build status" of `soiltexture` is "Current" (and not 
"Failed to build").

Open R, and type the command:

     install.packages("soiltexture", repos="http://R-Forge.R-project.org") 



Text based graphical user interface    <a id="text_gui"></a>
===================================

From version `1.3.0` the package soil texture comes along 
with a simple [text-based graphical user interface][text_gui]. 

After you have [installed](#installation) `R` and the package 
`soiltexture`, simply start R and type:

    soiltexture::soiltexture_gui()

This will start the text-based graphical user interface. You 
will be asked a series of simple question (4 to 8. With a list 
of possible answers), to import soil texture data, visualise 
it on a texture triangle and classify the texture data according 
to a classification system. Without typing any other commands 
than the one above. You can also display an empty texture 
triangle (without data-points) and/or display a texture triangle 
without classification system.

More information on how to prepare your soil texture data 
can be found on the function help page. In R, type:

    help( "soiltexture_gui" )

or simply

    ?soiltexture_gui

Note: An alternative way to call `soiltexture_gui` is to type:

    library( "soiltexture" ) 
    soiltexture_gui()



List of classification systems implemented    <a id="classif_systems"></a>
==========================================

Below is a list of texture triangles implemented in the 
package, together with their 'code' in the package.

*   HYPRES (European Soil Map): `HYPRES.TT`.
*   USDA (US): `USDA.TT`,
*   Aisne (France): `FR.AISNE.TT`.
*   GEPPA (France): `FR.GEPPA.TT`.
*   BK94 (Germany), Bodenkundliche Kartieranleitung 1994: `DE.BK94.TT`.
*   SEA74 (Germany), Standortserkundungsanweisung 1974: `DE.SEA74.TT`. 
*   TGL85 (Germany), 24300-05 landwirtschaftliche Boeden: `DE.TGL85.TT`. 
*   SSEW (UK),  Soil Survey of England and Wales: `UK.SSEW.TT`.
*   Australia: `AU2.TT`.
*   Belgium: `BE.TT`.
*   Canadian: `CA.FR.TT` (in French) or `CA.EN.TT` (in English). 
*   ISSS: `ISSS.TT`.
*   Romania, SRTS 2003: `ROM.TT`. 
*   Poland: `PL.TT`.
*   Brasil (1996), Brasil - Lemos & Santos: `BRASIL.TT`.
*   Brasil (2013), antos et al., 2013 - Embrapa: `SiBCS13.TT`. 
*   USDA 1911 (US), M. Whitney: `USDA1911`.



Acknowledgements (contributors)    <a id="acknowledgements"></a>
===============================

Many of the texture classification systems listed above wouldn't 
have been implemented without the contribution of the following 
people (contributors of the package):

*   Wei Shangguan.
*   Rainer Petzold.
*   Budiman Minasny.
*   Bogdan Rosca.
*   Nic Jelinski.
*   Wiktor Zelazny.
*   Rodolfo Marcondes Silva Souza.
*   Jose Lucas Safanelli.
*   Alexandre ten Caten.

They contributed to make `soiltexture` a useful tool for many 
soil scientists, and to make the specifications of these texture 
triangles available in an open-source format.



Other works and software on soil textures (triangles)    <a id="other_works"></a>
=====================================================

Numerous other works and software exist that deal with soil 
textures and soil textures triangles. Nevertheless, to my 
knowledge, The Soil Texture Wizard is the only tool that offers 
an integrated set of functionalities for soil textures (smart 
graphs + classification + multi-triangle + multi-geometry).



Ternary graphs (without soil textures classes)
----------------------------------------------

*   `triangle.plot` and `triangle.biplot` functions, from the 
    R package [ADE4][], by Daniel Chessel, Anne-Beatrice Dufour 
    and Stephane Dray. These functions are not specialised in 
    soil textures plots (and can not plot soil texture classes), 
    but offer of nice "zoom" feature that don't exist in The 
    Soil Texture Wizard, nor in the `PLOTRIX` package (see 
    below). For illustrations, see the web-page on 
    [triangle.plot][triangle.plot] on "R Graphical Manual" 
    (by _Osamu Ogasawara_).

*   `ternaryplot` function in the R package [VCD][] by David 
    Meyer, Achim Zeileis and Kurt Hornik. For illustrations, 
    see the web-page on [ternaryplot][] on "R Graphical Manual".



Ternary graphs (with soil textures classes)
-------------------------------------------

*   The functions `soil.texture` and `soil.texture.uk` from 
    the R package [plotrix][], by Jim Lemon _et al._. It allows 
    to create graphs, with or without soil textures data, 
    following the USDA or the UK soil texture triangles. There 
    is also an underlying ternary plot function that can be 
    used without soil texture classes. It is nevertheless not 
    possible to project the triangles into another geometry, 
    nor to transform or classify soil textures data. The R 
    functions presented here (`soiltexture`) are originally 
    derived from some functions of the [plotrix][] package. 
    For illustrations of [plotrix][], see the web-page on 
    [soil.texture][] and [soil.texture.uk][] on "R Graphical 
    Manual".

*   If you are fond of the package [ggplot2][], you may like 
    the package [ggtern][] that implements elegant ternary 
    diagrams and texture triangle (USDA) in a [ggplot2][] 
    fashion. Note: _The package seems to have been archived 
    from CRAN and is thus not available_ (2015/04/14).



Automatic classification
------------------------

*   [Texture Autolookup][TAL], by [Christopher Teh Boon Sung][ChristopherTBS] 
    is a standalone program, with a graphical user interface, 
    that can classify soil textures following the USDA, UK, 
    Canadian, FAO texture triangles, or 7 other systems. The 
    work has been published in two articles of "Communications 
    in Soil and Plant Analysis", in 1996 and 2003. The software 
    also allows to plot soil texture data in 2 different 
    triangle geometries. 

*   [TRIANGLE][Triangle], "A Program For Soil Textural 
    Classification", by Aris Gerakis and Brian Baer allows to 
    classify soil textures data after the USDA soil texture 
    triangle (published in the _Soil Science Society of America 
    Journal_ in 1999. [The article is available here][Gerakis1999]).

*   [r.soils.texture][] is a [Grass-GIS][] add-on for classifying 
    raster files of soil textures with 3 classification systems 
    (USDA, FAO, ISSS). Note that this is not R code.



Articles related to soil texture triangles or systems    <a id="articles"></a>
=====================================================

*   Richer de Forges A., Feller C., Jamagne M. & Arrouays D., 2008. 
    [Perdus dans le triangle des textures][deForges2008], _Études 
    et Gestion des Sols_, 15:2, pp. 97-111. En: "Lost in the 
    textures triangle". _The authors are presenting a gallery of 
    29 soil textures triangles, either still in use nowadays or 
    that were used in the past, from France and other countries, 
    and comparing the location of soil texture triangles limits 
    between several triangles. The article also presents a table 
    comparing the particle size limits (for clay, silt and sand 
    fractions) between numerous countries_.

*   Minasny B. and McBratney. A.B., 2001. [The australian soil 
    texture boomerang: a comparison of the australian and 
    usda/fao soil particle-size classication systems][Minasny2001]. 
    _Australian Journal of Soil Research_, 39:1443-1451.

*   Nemes A., Wösten J.H.M., Lilly A., and Oude Voshaar J.H., 
    1999. [Evaluation of different procedures to interpolate 
    particle-size distributions to achieve compatibility within 
    soil databases][Nemes1999]. _Geoderma_, 90:187-202, 1999.



See also (other R projects)    <a id="seealso"></a>
===========================

Other projects exists that provides useful soil-related R 
functions (toolboxes for the pedometrician):

*   [aqp][]. 'Algorithms for Quantitative Pedology'.

*   [soilwater][]. Provides soil water retention functions 
    and soil hydraulic conductivity functions and pedotransfer 
    functions to estimate their parameter from easily available 
    soil properties.

Other packages that may interest soil scientists are:

*   [soil.spec][]. Soil spectral data exploration and regression 
    functions.
    
*   [HydroMe][]. Estimation of Soil Hydraulic Parameters from 
    Experimental Data.
    
*   [SoPhy][]. A _defunct_ package that implemented a 2D water 
    infiltration model into R.



<!-- List if links  -->
[julienmoeys]:      http://julienmoeys.info/ "Julien Moeys homepage"
[triangle_gallery]: http://julienmoeys.info/2015/02/06/texture-triangle-gallery/
[SLU]:              http://www.slu.se/en/ "Swedish University of Agricultural Sciences"
[CKB]:              http://www.slu.se/en/collaborative-centres-and-projects/centre-for-chemical-pesticides-ckb1/ "The Centre for Chemical Pesticides (CKB)"
[TAL]:              http://www.christopherteh.com/tal/index.html "Texture AutoLookup (TAL)"
[ChristopherTBS]:   http://www.christopherteh.com/ "Christopher Teh Boon Sung"
[Triangle]:         http://nowlin.css.msu.edu/software/triangle_form.html "A Program For Soil Textural Classification"
[r.soils.texture]:  http://grasswiki.osgeo.org/wiki/GRASS_AddOns#r.soils.texture "r.soils.texture - GRASS GIS Add On"
[Grass-GIS]:        http://grass.osgeo.org/ "Grass-GIS"
[Gerakis1999]:      http://doi.org/10.2136/sssaj1999.634807x "A Computer Program for Soil Textural Classification"
[deForges2008]:     http://www.afes.fr/afes/egs/EGS_15_2_richerdeforges.pdf "Perdus dans le triangle des textures"
[Minasny2001]:      http://doi.org/10.1071/SR00065 "The australian soil texture boomerang"
[Nemes1999]:        http://dx.doi.org/10.1016/S0016-7061(99)00014-2 "Evaluation of different procedures to interpolate particle-size distributions ..."

<!-- Wikipedia      -->
[R_packages]:       http://en.wikipedia.org/wiki/R_%28programming_language%29#Packages "R packages (Wikipedia)" 
[text_gui]:         http://en.wikipedia.org/wiki/Text-based_user_interface "Text-based user interface (Wikipedia)" 
[soil_texture]:     http://en.wikipedia.org/wiki/Soil_texture "Soil texture (Wikipedia)" 
[texture_classif]:  http://en.wikipedia.org/wiki/Soil_texture#Soil_texture_classification "Soil texture classification (Wikipedia)" 
[ternary_plot]:     http://en.wikipedia.org/wiki/Ternary_plot "Ternary plot (Wikipedia)"

<!-- R packages     -->
[VCD]:              http://cran.r-project.org/web/packages/vcd/index.html "VCD R package" 
[aqp]:              http://aqp.r-forge.r-project.org/ "'aqp' R package"
[soilwater]:        http://soilwater.r-forge.r-project.org/ "soilwater R pacakges" 
[soil.spec]:        http://cran.r-project.org/web/packages/soil.spec/index.html "soil.spec R package"
[HydroMe]:          http://cran.r-project.org/web/packages/HydroMe/ "HydroMe R package" 
[SoPhy]:            http://cran.r-project.org/web/packages/SoPhy/index.html "SoPhy R package" 
[ade4]:             http://cran.univ-lyon1.fr/web/packages/ade4/index.html "ade4 R package" 
[plotrix]:          http://cran.r-project.org/web/packages/plotrix/index.html "plotrix R package" 
[ggplot2]:          http://ggplot2.org/ "ggplot2 R package" 
[ggtern]:           http://www.ggtern.com/ "ggtern R package"

<!-- Other R links  -->
[R]:                http://www.r-project.org/ "R software homepage" 
[CRAN]:             http://cran.r-project.org/ "The Comprehensive R Archive Network"
[CRAN_mirrors]:     http://cran.r-project.org/mirrors.html "CRAN Mirrors"
[triangle.plot]:    http://rgm3.lab.nig.ac.jp/RGM/R_rdfile?f=ade4/man/triangle.plot.Rd&d=R_CC "triangle.plot examples (R Graphical Manual)" 
[ternaryplot]:      http://rgm3.lab.nig.ac.jp/RGM/R_rdfile?f=VCD/man/ternaryplot.Rd&d=R_CC "ternaryplot examples (R Graphical Manual)" 
[soil.texture]:     http://rgm3.lab.nig.ac.jp/RGM/R_rdfile?f=plotrix/man/soil.texture.Rd&d=R_CC "soi.texture examples (R Graphical Manual)" 
[soil.texture.uk]:  http://rgm3.lab.nig.ac.jp/RGM/R_rdfile?f=plotrix/man/soil.texture.uk.Rd&d=R_CC "soi.texture.uk examples (R Graphical Manual)" 


