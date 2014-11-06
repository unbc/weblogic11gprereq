# Version: 0.0.4 Weblogic 11g Prerequisites
FROM unbc/oraclelinux6
MAINTAINER Trevor Fuson "trevor.fuson@unbc.ca"

# Requirements from http://docs.oracle.com/html/E25460_01/r2_fr_requirements.htm#sthref11
# Linux x86-64, Oracle Linux 6 UL1+
RUN [ "yum", "install", "binutils.x86_64",            "-y" ]
RUN [ "yum", "install", "compat-libcap1.x86_64",      "-y" ]
RUN [ "yum", "install", "compat-libstdc++-33.x86_64", "-y" ]
RUN [ "yum", "install", "compat-libstdc++-33.i686",   "-y" ]
RUN [ "yum", "install", "gcc.x86_64",                 "-y" ]
RUN [ "yum", "install", "gcc-c++.x86_64",             "-y" ]
RUN [ "yum", "install", "glibc.x86_64",               "-y" ]
RUN [ "yum", "install", "glibc.i686",                 "-y" ]
RUN [ "yum", "install", "glibc-devel.i686",           "-y" ]
RUN [ "yum", "install", "libaio.x86_64",              "-y" ]
RUN [ "yum", "install", "libaio-devel.x86_64",        "-y" ]
RUN [ "yum", "install", "libgcc.x86_64",              "-y" ]
RUN [ "yum", "install", "libstdc++.x86_64",           "-y" ]
RUN [ "yum", "install", "libstdc++.i686",             "-y" ]
RUN [ "yum", "install", "libstdc++-devel.x86_64",     "-y" ]
RUN [ "yum", "install", "libXext.i686",               "-y" ]
RUN [ "yum", "install", "libXtst.i686",               "-y" ]
RUN [ "yum", "install", "openmotif.x86_64",           "-y" ]
RUN [ "yum", "install", "openmotif22.x86_64",         "-y" ]
RUN [ "yum", "install", "redhat-lsb-core.x86_64",     "-y" ]
RUN [ "yum", "install", "sysstat.x86_64",             "-y" ]

# Java Download location. Note the build number is in the URL.
# http://www.oracle.com/technetwork/java/javase/downloads/jdk7-downloads-1880260.html
ENV JAVA_MINOR_VERSION 71
ENV JAVA_BUILD_NUMBER  14
ENV JAVA_HOME          /usr/java/jdk1.7.0_$JAVA_MINOR_VERSION
ENV PATH               JAVA_HOME/bin:$PATH

# Install Java JDK without leaving behind temporary files
RUN curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" \
 http://download.oracle.com/otn-pub/java/jdk/7u$JAVA_MINOR_VERSION-b$JAVA_BUILD_NUMBER/jdk-7u$JAVA_MINOR_VERSION-linux-x64.rpm > jdk-7u$JAVA_MINOR_VERSION-linux-x64.rpm && \
 rpm -ivh jdk-7u$JAVA_MINOR_VERSION-linux-x64.rpm && \
 rm jdk-7u$JAVA_MINOR_VERSION-linux-x64.rpm