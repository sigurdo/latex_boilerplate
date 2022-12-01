#!/bin/sh
set -e
cd $(dirname $0)/report_output/

rm -r ./*
cp -r ../report/* ./
cp -r ../source_code ./
pdflatex -shell-escape main.tex
bibtex main.aux
pdflatex -shell-escape main.tex
pdflatex -shell-escape main.tex
cp main.pdf ../Report.pdf
