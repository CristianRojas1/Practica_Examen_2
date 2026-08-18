FROM node:18-alpine
RUN addgroup -S app && adduser -S app -G app
WORKDIR /app
COPY package.json .
RUN npm install --production
COPY server.js .
USER app
EXPOSE 3002
CMD ["node","server.js"]
