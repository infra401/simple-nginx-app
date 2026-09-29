
FROM nginx:alpine

ARG BUILD_ID=local

COPY index.html /usr/share/nginx/html/index.html

RUN sed -i "s/BUILD_ID_PLACEHOLDER/${BUILD_ID}/g" /usr/share/nginx/html/index.html
