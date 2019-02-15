FROM node:10.6

RUN apt-get update && apt-get install -yq jq gconf-service libasound2 libatk1.0-0 libc6 libcairo2 libcups2 libdbus-1-3 libexpat1 libfontconfig1 libgcc1 libgconf-2-4 libgdk-pixbuf2.0-0 libglib2.0-0 libgtk-3-0 libnspr4 libpango-1.0-0 libpangocairo-1.0-0 libstdc++6 libx11-6 libx11-xcb1 libxcb1 libxcomposite1 libxcursor1 libxdamage1 libxext6 libxfixes3 libxi6 libxrandr2 libxrender1 libxss1 libxtst6 apt-transport-https ca-certificates fonts-liberation libappindicator1 libnss3 lsb-release xdg-utils wget redis-tools unzip curl

RUN curl -o- -L https://yarnpkg.com/install.sh | bash -s -- --version 1.13.0
RUN export PATH="$HOME/.yarn/bin:$PATH"
