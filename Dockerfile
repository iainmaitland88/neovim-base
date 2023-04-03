FROM ubuntu:22.04

RUN apt update && apt install -y git gettext tree ripgrep luajit ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl python3 pip nodejs npm

RUN git clone https://github.com/iainmaitland88/dotfiles-public.git /opt/dotfiles-public/ && cp -r /opt/dotfiles-public/dotfiles/. /root/

RUN git clone https://github.com/neovim/neovim /opt/neovim/ && cd /opt/neovim/ && make CMAKE_BUILD_TYPE=Release && make install

