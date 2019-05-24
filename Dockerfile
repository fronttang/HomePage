ARG node=node:lts
ARG nginx=nginx:1.15
FROM $node as download
COPY . /app
WORKDIR /app

RUN npm install
RUN npm run build

FROM $nginx

COPY --from=download /app/dist/  /usr/share/nginx/html/
ADD default.conf /etc/nginx/conf.d/
WORKDIR /usr/share/nginx/html
