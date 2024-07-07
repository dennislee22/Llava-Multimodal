FROM docker.repository.cloudera.com/cloudera/cdsw/ml-runtime-jupyterlab-python3.10-cuda:2023.08.2-b8

RUN apt-get update && \
    apt-get install -y ca-certificates curl python3-pip unzip && apt-get clean

RUN apt-get install -y ffmpeg gpg wget libcairo2-dev libxt-dev libgirepository-1.0-1 libasound2-dev espeak libespeak1

ENV ML_RUNTIME_EDITION="ffmpeg-espeak" \
       	ML_RUNTIME_SHORT_VERSION="2024.May.19" \
        ML_RUNTIME_MAINTENANCE_VERSION=1 \
        ML_RUNTIME_DESCRIPTION="ffmpeg-espeak"
ENV ML_RUNTIME_FULL_VERSION="${ML_RUNTIME_SHORT_VERSION}.${ML_RUNTIME_MAINTENANCE_VERSION}"
LABEL com.cloudera.ml.runtime.edition=$ML_RUNTIME_EDITION \
        com.cloudera.ml.runtime.full-version=$ML_RUNTIME_FULL_VERSION \
        com.cloudera.ml.runtime.short-version=$ML_RUNTIME_SHORT_VERSION \
        com.cloudera.ml.runtime.maintenance-version=$ML_RUNTIME_MAINTENANCE_VERSION \
        com.cloudera.ml.runtime.description=$ML_RUNTIME_DESCRIPTION
