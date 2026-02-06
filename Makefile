.PHONY: build clean watch

build:
	latexmk cv.tex

clean:
	latexmk -C cv.tex

watch:
	latexmk -pvc cv.tex
