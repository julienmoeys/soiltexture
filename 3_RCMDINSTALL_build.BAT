set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %pkgname%_1.2.13.tar.gz

pause
