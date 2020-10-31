#!/bin/sh
IMAGE=blang/latex:ubuntu

MAIN_LATEX_FILE="cv.tex"
OUTPUT_DIR="cv"

mkdir -p $OUTPUT_DIR

COMMAND="pdflatex -output-directory $OUTPUT_DIR $MAIN_LATEX_FILE"

if [[ `uname -s` == MINGW* ]];
then
	# if run on gitbash for Windows
    exec docker run --rm -i --net=none -v "`pwd | sed -E 's/^\/(.)\//\1:\//'`":/data "$IMAGE" $COMMAND
else
	# run in a "classic" terminal 
    exec docker run --rm -i --user="$(id -u):$(id -g)" --net=none -v "$PWD":/data "$IMAGE" $COMMAND
fi
