FROM eclipse-temurin:17-jdk-jammy

WORKDIR /opt/traccar

ENV TRACCAR_VERSION=5.9

RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L "https://github.com/traccar/traccar/releases/download/v${TRACCAR_VERSION}/traccar-linux-x64-${TRACCAR_VERSION}.zip" -o traccar.zip && \
    unzip traccar.zip && \
    rm traccar.zip

EXPOSE 5055 8082

CMD ["sh", "-c", "bin/traccar run"]
