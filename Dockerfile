FROM alpine:latest

RUN apk add --no-cache wget unzip

WORKDIR /app

RUN wget https://github.com/Tyguy047/Desktop-Ticker-Backend/releases/download/Version-0.1.0/desktop-ticker-backend-amd64.zip

RUN unzip desktop-ticker-backend-amd64.zip && rm -rf desktop-ticker-backend-amd64.zip

EXPOSE 8080

CMD ["./desktop-ticker-backend-amd64"]