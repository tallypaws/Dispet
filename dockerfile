FROM node:22-alpine

WORKDIR /app

COPY package*.json ./
RUN if [ -f package.json ]; then npm ci --only=production --no-audit --no-fund; fi

COPY --chown=node:node . .

USER node

CMD ["node", "index"]