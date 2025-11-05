FROM alpine:latest

RUN apk add --no-cache wget unzip

RUN wget https://github.com/XTLS/Xray-core/releases/download/v1.8.4/Xray-linux-64.zip && \
    unzip Xray-linux-64.zip && \
    rm -f Xray-linux-64.zip && \
    chmod +x xray

RUN mkdir -p /etc/xray
COPY config.json /etc/xray/config.json

EXPOSE 8080
CMD ["./xray", "run", "-config", "/etc/xray/config.json"]
