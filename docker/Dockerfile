FROM redhat/ubi8

RUN dnf update

RUN dnf install -y jq

COPY entrypoint.sh /entrypoint.sh

CMD ["/entrypoint.sh"]
