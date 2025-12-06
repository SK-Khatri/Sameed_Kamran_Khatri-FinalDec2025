# small, reproducible node runtime
FROM node:18-alpine

WORKDIR /app

# copy package files first for caching
COPY package*.json ./
COPY package-lock.json ./

RUN npm ci --only=production

COPY index.js .

CMD ["node", "index.js"]
