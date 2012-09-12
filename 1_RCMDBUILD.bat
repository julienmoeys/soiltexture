c:
cd \
cd "C:\_R_PACKAGES\soiltexture\pkg" 
echo R_QPDF="qpdf -dPDFSETTINGS=/ebook" 
R CMD build --compact-vignettes="gs"  soiltexture 
pause
