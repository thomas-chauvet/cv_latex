#!/bin/sh

INPUT_EXTRA_CTAN_PACKAGES="moderncv xargs bigfoot colortbl pgf fontawesome"

if [[ `uname -s` == MINGW* ]];
then
	# if run on gitbash for Windows
	dos2unix entrypoint.sh
	docker build -t cv_latex . 
	docker run --rm -i -v "`pwd | sed -E 's/^\/(.)\//\1:\//'`"/cv:/cv \
		--env INPUT_EXTRA_CTAN_PACKAGES="$INPUT_EXTRA_CTAN_PACKAGES" \
		--env INPUT_OUTPUT_DIR="cv" \
		--env INPUT_MAIN_LATEX_FILE="cv.tex" \cv_latex
else
	# run in a "classic" terminal 
	docker build -t cv_latex .
	docker run --rm -i -v $(pwd)/cv:cv \
		--env INPUT_EXTRA_CTAN_PACKAGES="$INPUT_EXTRA_CTAN_PACKAGES" \
		--env INPUT_OUTPUT_DIR="cv" \
		--env INPUT_MAIN_LATEX_FILE="cv.tex" \
		cv_latex
fi
