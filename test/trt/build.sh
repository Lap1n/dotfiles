#!/bin/bash
git lfs install
git submodule update --init --recursive
DOCKER_BUILDKIT=1 docker build -t triton_trt_llm --build-arg="BASE_IMAGE=test_server_trt_base" --build-arg="BASE_TAG=latest" -f dockerfile/Dockerfile.trt_llm_backend .
