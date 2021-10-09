FROM ubuntu:latest
ARG DEBIAN_FRONTEND="noninteractive"
RUN mkdir /app
COPY VerthashMiner-Launcher.bash /app
RUN \
 apt-get update && \
 apt-get install -y wget ocl-icd-libopencl1 opencl-headers clinfo ocl-icd-opencl-dev nvidia-cuda-toolkit && \
 apt-get autoremove && \
 apt-get clean && \
 rm -rf \
 /tmp/* \
 /var/lib/apt/lists/* \
 /var/tmp/*
WORKDIR /app
RUN wget -P /tmp/ https://github.com/CryptoGraphics/VerthashMiner/releases/download/0.7.2/VerthashMiner-0.7.2-CUDA11-linux.tar.gz
RUN tar -xvf /tmp/VerthashMiner*.tar.gz --strip 1
CMD ["bash", "VerthashMiner-Launcher.bash"]
