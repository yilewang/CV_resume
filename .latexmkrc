$pdf_mode = 5;   # XeLaTeX
$xelatex = 'xelatex -interaction=nonstopmode -halt-on-error -file-line-error %O %S';
# Editors that force -pdf (pdfLaTeX) still get XeLaTeX: the class needs fontspec.
$pdflatex = $xelatex;
@default_files = ('cv.tex', 'resume.tex');
