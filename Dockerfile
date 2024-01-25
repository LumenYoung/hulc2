FROM mambaorg/micromamba:jammy-cuda-12.3.1

COPY --chown=$MAMBA_USER:$MAMBA_USER docker/env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes

WORKDIR /repo
COPY --chown=$MAMBA_USER:$MAMBA_USER . /repo

USER root

RUN apt-get update && apt install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

USER $MAMBA_USER

# RUN bash install.sh
