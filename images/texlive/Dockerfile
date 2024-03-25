FROM localhost/images/java17
# arara doesn't run on java 21, therefore we build on java 17.
# As /usr/local/bin is before /usr/bin in the PATH, our own java 17 will be used.
RUN apt-get update && apt-get install -y perl texlive-full && luaotfload-tool -ufpv
