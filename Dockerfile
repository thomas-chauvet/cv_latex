FROM blang/latex:ubuntu

WORKDIR /

COPY . /

COPY entrypoint.sh /entrypoint.sh

ENV OUTPUT_DIR="cv"

ENTRYPOINT ["/entrypoint.sh"]