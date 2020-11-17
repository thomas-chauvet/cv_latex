#!/bin/sh -l

tlmgr install xetex

if [ -z "$INPUT_EXTRA_CTAN_PACKAGES" ] ; then
	echo No package to install;
else
	tlmgr install $INPUT_EXTRA_CTAN_PACKAGES;
fi

mkdir -p $INPUT_OUTPUT_DIR

lualatex -output-directory $INPUT_OUTPUT_DIR $INPUT_MAIN_LATEX_FILE

echo $GITHUB_REPOSITORY 

if [ ! -z "$GITHUB_REPOSITORY" ] ; then
	time=$(date)
	echo "::set-output name=time::$time"
fi
