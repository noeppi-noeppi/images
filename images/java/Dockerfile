FROM debian:trixie AS setup-java
ARG JDK

# Set up JDKs for the agent image
RUN apt-get update && apt-get install -y curl jq && apt-get clean
COPY --chown=root:root --chmod=00755 download-java.sh /download-java.sh
RUN bash /download-java.sh "${JDK}"

FROM ghcr.io/noeppi-noeppi/images/actions
ARG JDK

RUN apt-get update && apt-get install -y ca-certificates-java && apt-get clean
COPY --from=setup-java /opt/java /opt/java
ENV JAVA_HOME="/opt/java/jdk-${JDK}"
ENV PATH="/opt/java/jdk-${JDK}/bin:${PATH}"
