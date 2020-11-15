#!/bin/sh -l

MAIN_LATEX_FILE="$MAIN_LATEX_FILE"

OUTPUT_DIR="$OUTPUT_DIR"

mkdir -p $OUTPUT_DIR

pdflatex -output-directory $OUTPUT_DIR $MAIN_LATEX_FILE

time=$(date)
echo "::set-output name=time::$time"
