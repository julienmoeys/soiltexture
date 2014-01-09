set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD build --compact-vignettes="gs" --md5 %pkgname% 

pause
