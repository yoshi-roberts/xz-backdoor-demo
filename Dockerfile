FROM ubuntu:latest
# RUN touch /var/mail/ubuntu && chown ubuntu /var/mail/ubuntu && userdel -r ubuntu

# ARG USER_ID
# ARG GROUP_ID

# ENV TERM=xterm-256color

# Update system and install packages.
RUN apt update -y
RUN apt upgrade -y
RUN apt install -y software-properties-common

RUN apt update -y && apt install -y \
pkg-config apt-utils sudo bash curl wget zip unzip git golang-go

# Set the locale.
# RUN sed -i '/en_US.UTF-8/s/^# //g' /etc/locale.gen && locale-gen
# ENV LANG en_US.UTF-8  
# ENV LANGUAGE en_US:en  
# ENV LC_ALL en_US.UTF-8

RUN git clone https://github.com/amlweems/xzbot.git && cd xzbot
RUN git clone https://github.com/openssh/openssh-portable

# Create user.
# RUN groupadd --gid $GROUP_ID dev
# RUN adduser --disabled-password --gecos '' -uid $USER_ID --gid $GROUP_ID --shell /usr/bin/zsh dev
# RUN usermod -aG sudo dev
# RUN echo '%sudo ALL=(ALL) NOPASSWD:ALL' >> /etc/sudoers
# USER dev

WORKDIR xzbot
ENTRYPOINT ["bash"]
