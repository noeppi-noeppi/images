FROM images/actions
ARG JDK
RUN <<EOV
mkdir -p /opt/java
wget -nv -O - "https://github.com/adoptium/temurin21-binaries/releases/download/${JDK}" | tar -C /opt/java -xz
find /opt/java -path '*/bin/*' | while read z; do
  ln -s "${z}" "/usr/local/bin/$(basename "${z}")"
done
EOV
