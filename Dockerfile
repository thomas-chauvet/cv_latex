FROM blang/latex:ubuntu

COPY . /data/

COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]