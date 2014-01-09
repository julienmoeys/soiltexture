set pkgname=ternaryplot

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD INSTALL --build --compact-docs --byte-compile %pkgname%

pause
