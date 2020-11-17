#!/bin/sh -l


echo "INPUT_MAIN_LATEX_FILE: $INPUT_MAIN_LATEX_FILE"
echo "INPUT_CTAN_PACKAGES: $INPUT_CTAN_PACKAGES"
echo "OUTPUT_DIR: $OUTPUT_DIR"
echo "MAIN_LATEX_FILE: $MAIN_LATEX_FILE"
echo "CTAN_PACKAGES: $CTAN_PACKAGES"


tlmgr install xetex

if [ -z "$EXTRA_CTAN_PACKAGES" ] ; then
	echo No package to install;
else
	tlmgr install $EXTRA_CTAN_PACKAGES;
fi

mkdir -p $OUTPUT_DIR

lualatex -output-directory $OUTPUT_DIR $MAIN_LATEX_FILE

echo $GITHUB_REPOSITORY 

if [ ! -z "$GITHUB_REPOSITORY" ] ; then
	time=$(date)
	echo "::set-output name=time::$time"
fi
