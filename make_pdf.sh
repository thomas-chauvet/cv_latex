#!/bin/sh

if [[ `uname -s` == MINGW* ]];
then
	# if run on gitbash for Windows
	dos2unix entrypoint.sh
	docker build -t cv_latex .
	docker run --rm -i -v "`pwd | sed -E 's/^\/(.)\//\1:\//'`"/cv:/cv cv_latex
else
	# run in a "classic" terminal 
	docker build -t cv_latex .
	docker run --rm -i -v $(pwd)/cv:/cv cv_latex
fi
