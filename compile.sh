#!/bin/sh
set -e
cd $(dirname $0)/report_output/

rm -rf ./*
cp -rf ../report/* ./
cp -rf ../source_code ./
pdflatex -shell-escape main.tex
bibtex main.aux
pdflatex -shell-escape main.tex
pdflatex -shell-escape main.tex
cp -f main.pdf ../Report.pdf
