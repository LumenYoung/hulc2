FROM mambaorg/micromamba:jammy-cuda-12.3.1

COPY --chown=$MAMBA_USER:$MAMBA_USER docker/env.yaml /tmp/env.yaml
RUN micromamba install -y -n base -f /tmp/env.yaml && \
    micromamba clean --all --yes

USER root

RUN apt-get update && apt install -y --no-install-recommends git \
    && rm -rf /var/lib/apt/lists/*

RUN mkdir /repo && chown -R $MAMBA_USER:$MAMBA_USER .

USER $MAMBA_USER

COPY --chown=$MAMBA_USER:$MAMBA_USER . /home/$MAMBA_USER/repo

WORKDIR /repo

# RUN bash install.sh
