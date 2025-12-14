FROM node:22-slim

WORKDIR /app
RUN touch /app/database.db /app/config.json
# I HATE PYTHON
RUN apt-get update && apt-get install -y \
    python3 \
    make \
    g++ \
    libcairo2-dev \
    libpango1.0-dev \
    libjpeg-dev \
    libgif-dev \
    librsvg2-dev \
    && rm -rf /var/lib/apt/lists/*

COPY package*.json ./
RUN if [ -f package.json ]; then npm i  --no-audit --no-fund; fi

COPY --chown=node:node . .

USER node

CMD ["node", "index"]