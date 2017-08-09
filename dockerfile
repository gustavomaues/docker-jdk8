FROM debian-base:latest

LABEL br.ufpa.ctic.docker.imagem="Debian com JDK 8"

ENV JAVA_VERSION=8u144
ENV JAVA_BUILD=b01
ENV JVM_PATH=/usr/lib/jvm
ENV JAVA_HOME=$JVM_PATH/jdk$JAVA_VERSION

RUN curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" -o /tmp/jdk8.tar.gz \
    "http://download.oracle.com/otn-pub/java/jdk/$JAVA_VERSION-$JAVA_BUILD/090f390dda5b47b9b721c7dfaa008135/jdk-$JAVA_VERSION-linux-x64.tar.gz" \
    && mkdir -p $JVM_PATH && tar xvzf /tmp/jdk8.tar.gz -C $JVM_PATH \
    && update-alternatives --install "/usr/bin/java" "java" "$JAVA_HOME/bin/java" 1 \
    && rm -rf /tmp/*
