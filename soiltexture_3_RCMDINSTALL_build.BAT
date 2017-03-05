set pkgname=soiltexture

cd /D "%rPackagesDir%\%pkgname%\pkg" 

prompt $g

@echo :::: Finding latest version of package source ::::

dir %pkgname%_*tar.gz /b /o:-n > tmp.txt
set /p targzfile=<tmp.txt 
del tmp.txt

@echo :::: Processing %targzfile% ::::

R CMD INSTALL --build --compile-both --compact-docs --byte-compile %targzfile%

@REM 

pause
