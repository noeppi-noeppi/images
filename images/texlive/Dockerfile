FROM ghcr.io/noeppi-noeppi/images/java21
RUN apt-get update && apt-get install -y perl texlive-full qpdf pdftk && apt-get clean
RUN luaotfload-tool -ufpv
