# FROM nvidia/cuda:12.2.2-cudnn8-runtime-ubuntu22.04
# FROM nvidia/cuda:12.2.2-cudnn8-devel-ubuntu22.04
FROM nvidia/cuda:12.3.2-cudnn9-devel-ubuntu22.04

RUN apt-get update && apt-get install -y --no-install-recommends \
    curl

ENV _CUDA_COMPAT_PATH=/usr/local/cuda/compat
ENV ENV=""
