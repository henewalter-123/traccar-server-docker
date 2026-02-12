FROM eclipse-temurin:17-jdk-jammy

WORKDIR /opt/traccar

RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L "https://github.com/traccar/traccar/releases/download/v5.9/traccar-linux-x64-5.9.zip" -o traccar.zip && \
    unzip traccar.zip && \
    rm traccar.zip && \
    apt-get remove --purge -y curl unzip && \
    apt-get autoremove -y && \
    apt-get clean

EXPOSE 8082 5000-5150

CMD ["./traccar.run"]
