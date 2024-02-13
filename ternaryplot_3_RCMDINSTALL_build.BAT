set pkgname=ternaryplot

cd /D "%rPackagesDir%\soiltexture\pkg" 

R CMD INSTALL --build --compact-docs --byte-compile %pkgname%

pause
