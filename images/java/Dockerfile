FROM localhost/images/actions
ARG JDK
RUN <<EOV
set -e
mkdir -p /opt/java/jdk
wget -nv -O - "${JDK}" | tar -C /opt/java/jdk -xz --strip-components=1
find /opt/java/jdk/bin -mindepth 1 -maxdepth 1 | while read z; do
  ln -s "${z}" "/usr/local/bin/$(basename "${z}")"
done
EOV
ENV JAVA_HOME="/opt/java/jdk"
