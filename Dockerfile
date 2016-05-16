FROM ubuntu:latest

RUN apt-get update
RUN apt-get install -y zsh
RUN apt-get install -y git
RUN apt-get install -y curl

RUN useradd -d /home/dan -c 'dan' -s /bin/zsh dan
RUN mkdir /home/dan && chown dan:dan /home/dan

USER dan
WORKDIR /home/dan

RUN curl -o install.sh -L https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh
RUN echo "exit 0" >> install.sh
RUN chmod 700 install.sh
# this stupid command exits 1, echo something after so it doesn't fail
RUN ./install.sh ; echo 'done'

