#!/usr/bin/env bash

# Build image and add a descriptive tag
docker build --tag capstone .

#run app which includes index.html file
docker run -p 8000:80 capstone