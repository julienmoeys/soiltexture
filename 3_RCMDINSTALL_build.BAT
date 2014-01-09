set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD INSTALL --build --compact-docs --byte-compile %pkgname%_1.2.12.tar.gz

pause
