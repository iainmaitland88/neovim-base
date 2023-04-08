FROM ubuntu:22.04

RUN apt -y autoremove && apt update && apt install -y git gettext tree ripgrep luajit ninja-build gettext libtool-bin cmake g++ pkg-config unzip curl python3 pip tmux wget

RUN curl -fsSL https://deb.nodesource.com/setup_18.x | bash - && apt-get install -y nodejs

RUN git clone https://github.com/iainmaitland88/dotfiles-public.git /opt/dotfiles-public/ && cp -r /opt/dotfiles-public/dotfiles/. /root/

RUN git clone https://github.com/neovim/neovim /opt/neovim/ && cd /opt/neovim/ && make CMAKE_BUILD_TYPE=Release && make install

RUN curl -sSL https://install.python-poetry.org | python3 -

ENV PATH="$PATH:/root/.local/bin"
