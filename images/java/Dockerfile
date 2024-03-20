FROM x-template:actions
ARG JDK_URL
RUN <<EOV
mkdir -p /opt/java
wget -nv -O - "${JDK_URL}" | tar -C /opt/java -xz
find /opt/java -path '*/bin/*' | while read z; do
  ln -s "${z}" "/usr/local/bin/$(basename "${z}")"
done
EOV
