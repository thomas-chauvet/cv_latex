#!/bin/sh -l

MAIN_LATEX_FILE="cv.tex"

OUTPUT_DIR="cv"

mkdir -p /$OUTPUT_DIR

pdflatex -output-directory /$OUTPUT_DIR /data/$MAIN_LATEX_FILE

time=$(date)
echo "::set-output name=time::$time"
