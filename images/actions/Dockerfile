FROM node:24-trixie
RUN apt-get update && apt-get install -y \
    coreutils binutils util-linux procps file time lsof tar zip less bash vim git curl wget gawk perl python3 \
    python3-pip python3-venv pipenv jq iproute2 traceroute net-tools netcat-openbsd socat bind9-dnsutils debconf \
    ca-certificates openssl build-essential pkgconf make golang && apt-get clean
ENTRYPOINT [ "bash" ]
