set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

svnversion > %pkgname%\SVN_VERSION

R CMD build --compact-vignettes="gs+qpdf" --md5 %pkgname% 

pause
