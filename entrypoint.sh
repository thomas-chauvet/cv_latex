#!/bin/sh -l

tlmgr install xetex

if [ -z "$EXTRA_CTAN_PACKAGES" ] ; then
	echo No package to install;
else
	tlmgr install $EXTRA_CTAN_PACKAGES;
fi

MAIN_LATEX_FILE="$MAIN_LATEX_FILE"

OUTPUT_DIR="$OUTPUT_DIR"

mkdir -p $OUTPUT_DIR

lualatex -output-directory $OUTPUT_DIR $MAIN_LATEX_FILE

echo $GITHUB_REPOSITORY 

if [ ! -z "$GITHUB_REPOSITORY" ] ; then
	time=$(date)
	echo "::set-output name=time::$time"
fi
