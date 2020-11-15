FROM blang/latex:ubuntu

WORKDIR /

COPY . /

COPY entrypoint.sh /entrypoint.sh

ENV OUTPUT_DIR="cv"

ENV MAIN_LATEX_FILE="cv.tex"

ENV EXTRA_CTAN_PACKAGES=""

RUN tlmgr init-usertree

RUN for package in EXTRA_CTAN_PACKAGES; do tlmgr install "$package"; done 

ENTRYPOINT ["/entrypoint.sh"]