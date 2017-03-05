set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

git log -n 1 --oneline --no-notes > %pkgname%\inst\GIT_REVISION

R CMD build --compact-vignettes="gs+qpdf" --md5 %pkgname% 

pause
