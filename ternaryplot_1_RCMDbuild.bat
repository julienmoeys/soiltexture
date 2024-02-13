set pkgname=ternaryplot

cd /D "%rPackagesDir%\soiltexture\pkg" 

svnversion > %pkgname%\REVISION

R CMD build --compact-vignettes="gs+qpdf" %pkgname% 

pause
