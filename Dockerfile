FROM node:18 as backend

WORKDIR /app

COPY package*.json /app

RUN npm install

RUN yarn install --production

FROM node:18-slim 

WORKDIR /app

COPY --from=backend /app .

COPY . .

CMD ["node", "src/index.js"]
