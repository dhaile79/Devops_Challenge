FROM node:16



ENV NODE_VERSION 18.0.0
ENV PATH="${PATH}:/sbin"
WORKDIR /app
ENV NVM_DIR=/root/.nvm
ENV PATH="/root/.nvm/versions/node/v${NODE_VERSION}/bin/:${PATH}"
RUN node --version
RUN npm --version
COPY package.json /app
RUN npm install
COPY . /app
CMD node app.js
EXPOSE 8080