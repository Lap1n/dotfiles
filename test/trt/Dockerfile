FROM test_server

ENV _CUDA_COMPAT_PATH=/usr/local/cuda/compat
ENV ENV=" "
RUN apt-get update && apt-get install -y libopenmpi-dev && pip install mpi4py
