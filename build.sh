#!/bin/bash
set -e

docker build -t 'images/actions' images/actions
docker build -t 'images/java17' --build-arg="JDK=jdk-17.0.10%2B7/OpenJDK17U-jdk_x64_linux_hotspot_17.0.10_7.tar.gz" images/java
docker build -t 'images/java21' --build-arg="JDK=jdk-21.0.2%2B13/OpenJDK21U-jdk_x64_linux_hotspot_21.0.2_13.tar.gz" images/java
docker build -t 'images/texlive' images/texlive
