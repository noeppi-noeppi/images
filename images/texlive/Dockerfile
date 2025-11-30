FROM debian:trixie AS setup-typst

RUN apt-get update && apt-get install -y curl xz-utils && apt-get clean
COPY --chown=root:root --chmod=00755 download-typst.sh /download-typst.sh
RUN bash /download-typst.sh "0.14.0"

FROM ghcr.io/noeppi-noeppi/images/java21
RUN apt-get update && apt-get install -y perl texlive-full qpdf pdftk poppler-utils mupdf-tools pandoc && apt-get clean
RUN luaotfload-tool -ufpv

COPY --from=setup-typst /opt/typst /opt/typst
RUN ln -s /opt/typst/typst /usr/local/bin/typst
