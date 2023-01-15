FROM ubuntu:22.04

RUN apt update

RUN apt install -y software-properties-common

RUN add-apt-repository ppa:deadsnakes/ppa

RUN apt update

ENV TZ=Africa/Tunis

RUN ln -snf /usr/share/zoneinfo/$TZ /etc/localtime && echo $TZ > /etc/timezone

RUN apt -y install python3.9

RUN apt -y install curl

RUN apt -y install pip

RUN apt install -y python3.9-

RUN apt install \
    ca-certificates \
    gnupg \
    lsb-release

RUN mkdir -p /etc/apt/keyrings

RUN curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

RUN echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
    $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

RUN apt update

RUN apt install docker-ce docker-ce-cli containerd.io docker-compose-plugin

CMD ["tail", "-F", "anything"]