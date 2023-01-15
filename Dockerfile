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

RUN apt install -y python3.9-distutils

CMD ["tail", "-F", "anything"]