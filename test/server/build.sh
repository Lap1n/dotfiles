# Run the build script from Triton Server repo. The flags for some features or
# endpoints can be removed if not needed. Please refer to the support matrix to
# see the aligned versions: https://docs.nvidia.com/deeplearning/frameworks/support-matrix/index.html
# TRTLLM_BASE_IMAGE=trtllm_base
BASE_IMAGE=test
# TENSORRTLLM_BACKEND_REPO_TAG=v0.7.2
PYTHON_BACKEND_REPO_TAG=r24.01

# ./build.py -v --no-container-interactive --enable-logging --enable-stats --enable-tracing \
#               --enable-metrics --enable-gpu-metrics --enable-cpu-metrics \
#               --filesystem=gcs --filesystem=s3 --filesystem=azure_storage \
#               --endpoint=http --endpoint=grpc --endpoint=sagemaker --endpoint=vertex-ai \
#               --backend=ensemble --enable-gpu --endpoint=http --endpoint=grpc \
#               --no-container-pull \
#               --image=base,${TRTLLM_BASE_IMAGE} \
#               --backend=tensorrtllm:${TENSORRTLLM_BACKEND_REPO_TAG} \
#               --backend=python:${PYTHON_BACKEND_REPO_TAG}
export DOCKER_BUILDKIT=1
./build.py -v --no-container-interactive --enable-logging --enable-stats --enable-tracing \
              --enable-metrics --enable-gpu-metrics --enable-cpu-metrics \
              --filesystem=azure_storage \
              --endpoint=http --endpoint=grpc \
              --backend=ensemble --enable-gpu --endpoint=http --endpoint=grpc \
              --no-container-pull \
              --image=base,${BASE_IMAGE} \
              -v \
              --backend=python:${PYTHON_BACKEND_REPO_TAG}
