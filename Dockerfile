FROM node:10.16.3

# Libs
RUN apt-get update && apt-get install -yq jq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils redis-tools ca-certificates wget unzip curl apt-utils apt-transport-https

# Yarn
RUN curl https://deb.nodesource.com/setup_10.x | bash
RUN curl https://dl.yarnpkg.com/debian/pubkey.gpg | apt-key add -
RUN echo "deb https://dl.yarnpkg.com/debian/ stable main" | tee /etc/apt/sources.list.d/yarn.list
RUN apt-get update && apt-get install -y yarn

# GD graphics lib
RUN echo "deb http://httpredir.debian.org/debian stable main contrib" >> /etc/apt/sources.list.d/nonfree.list
RUN apt-get update && apt-get install -y ttf-mscorefonts-installer

# Fonts
RUN echo "deb http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | tee /etc/apt/sources.list.d/infinality.list && \
    echo "deb-src http://ppa.launchpad.net/no1wantdthisname/ppa/ubuntu trusty main" | tee -a /etc/apt/sources.list.d/infinality.list && \
    apt-key adv --keyserver keyserver.ubuntu.com --recv-keys E985B27B && \
    apt-get update && apt-get install -y --no-install-recommends \
    fontconfig-infinality fonts-liberation && \
    bash /etc/fonts/infinality/infctl.sh setstyle osx
