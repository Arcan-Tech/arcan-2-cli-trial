# syntax=docker/dockerfile:1.2

# Shared slim-base image without sources
FROM maven:3-eclipse-temurin-18 as base
WORKDIR /arcan

RUN rm -f /etc/apt/apt.conf.d/docker-clean

ENV DOTNET_ROOT=/usr/lib/dotnet
RUN apt-get update && apt-get install -y \
    unzip \
    ca-certificates \
    libgomp1 \
    wget \
    gnupg \
    && rm -rf /var/lib/apt/lists/*

RUN wget -qO dotnet-sdk-6.tar.gz https://download.visualstudio.microsoft.com/download/pr/5d0a2a83-38d2-47b8-af9c-b4388e7d0c3a/c7e7502cfa3a7344b6c0c36014a43189/dotnet-sdk-6.0.109-linux-x64.tar.gz \
    && mkdir ${DOTNET_ROOT} && tar zxf dotnet-sdk-6.tar.gz -C ${DOTNET_ROOT} \
    && ln -s ${DOTNET_ROOT}/dotnet /usr/bin/dotnet

RUN apt-key adv --keyserver hkp://keyserver.ubuntu.com:80 --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF \
    && echo "deb https://download.mono-project.com/repo/ubuntu stable-focal main" | tee /etc/apt/sources.list.d/mono-official-stable.list \
    && apt update && apt install -y mono-complete

ARG NODE_VERSION=16.14.0
ENV NODE_VERSION=${NODE_VERSION}
ENV NVM_DIR=/.nvm
ENV PATH="${NVM_DIR}/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN mkdir $NVM_DIR

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash
RUN . "${NVM_DIR}/nvm.sh" && nvm install ${NODE_VERSION}
RUN . "${NVM_DIR}/nvm.sh" && nvm use v${NODE_VERSION}
RUN . "${NVM_DIR}/nvm.sh" && nvm alias default v${NODE_VERSION}

COPY language-servers ./language-servers

RUN cd language-servers/ && ./fetch-ls.sh && cd ..
RUN rm dotnet-sdk-6.tar.gz

# CLI
FROM base as cli
ARG ARCAN_VERSION=2.9.6-RELEASE
 
COPY bin/Arcan2-cli-${ARCAN_VERSION}.zip arcan-cli.zip 

RUN unzip arcan-cli.zip
RUN rm arcan-cli.zip

ENTRYPOINT ["./arcan.sh"]
