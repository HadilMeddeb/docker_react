FROM node:alpine as builder
WORKDir  /app

COPY package.json .
RUN npm install

COPY . . 
CMD ["npm","run","install"]




FROM nginx
COPY --from=builder /app/build  /usr/share/nginx/html
