# syntax=docker/dockerfile:1
FROM node:20-alpine
WORKDIR /app
COPY package*.json ./
RUN npm ci || npm install
COPY . .
# if the app has a build step, keep this; otherwise it's harmless
RUN npm run build || true
ENV NODE_ENV=production
# Fly will map this; most Node apps can read PORT
ENV PORT=8080
EXPOSE 8080
CMD ["npm","start"]
