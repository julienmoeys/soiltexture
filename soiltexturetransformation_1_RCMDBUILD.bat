set pkgname=soiltexturetransformation

cd /D "%rPackagesDir%\soiltexture\pkg" 

R CMD build --compact-vignettes="gs" --md5 %pkgname% 

pause
