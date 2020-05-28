#!/bin/bash

docker build -f Dockerfile.dev .

# Create and run container:
#docker run <IMAGE_ID>