FROM alpine/helm:3.11.1
RUN apk add curl tar bash --no-cache
RUN helm plugin install https://github.com/chartmuseum/helm-push
COPY entrypoint.sh /entrypoint.sh
RUN chmod +x /entrypoint.sh
ENTRYPOINT ["/entrypoint.sh"] 