#!/bin/bash
set -e

docker push 'images/actions:latest'
docker push 'images/java17:latest'
docker push 'images/java21:latest'
docker push 'images/texlive:latest'
