FROM ubuntu:22.04

RUN apt-get update && apt-get install -y sudo

ARG USERNAME=user
ARG GROUPNAME=user
ARG UID=1001
ARG GID=1001
ARG PASSWORD=user
RUN groupadd -g $GID $GROUPNAME && \
    useradd -m -s /bin/bash -u $UID -g $GID -G sudo $USERNAME && \
    echo $USERNAME:$PASSWORD | chpasswd && \
    echo "$USERNAME   ALL=(ALL) NOPASSWD:ALL" >> /etc/sudoers && \
    apt update && apt install -y git curl unzip gcc make automake pkg-config libncurses5-dev bison zsh && \
    apt clean && rm -rf /var/lib/apt/lists/*

USER $USERNAME
WORKDIR /home/$USERNAME/

RUN sh -c "$(curl -fsLS get.chezmoi.io)" && mkdir -p .local/share/
ENV PATH=$PATH:/home/$USERNAME/bin

