# Dockerfile for Biblioteca Digital UniFECAF (mock API + static site)
FROM node:18-alpine
WORKDIR /usr/src/app

# Install dependencies first (package.json present)
COPY package*.json ./
RUN npm install --production --silent

# Copy app files
COPY . .

EXPOSE 3000

# Start the mock API (serves static site and API)
CMD ["node","server.js"]
