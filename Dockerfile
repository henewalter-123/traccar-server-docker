FROM openjdk:17-jdk-slim

WORKDIR /opt/traccar

# Instalar curl, unzip y limpiar luego
RUN apt-get update && \
    apt-get install -y curl unzip && \
    curl -L "https://github.com/traccar/traccar/releases/download/v5.9/traccar-linux-x64-5.9.zip" -o traccar.zip && \
    unzip traccar.zip && \
    rm traccar.zip && \
    apt-get remove --purge -y curl unzip && \
    apt-get autoremove -y && \
    apt-get clean

# Exponer puertos: interfaz web y puertos de protocolo GPS
EXPOSE 8082 5000-5150

# Comando de inicio
CMD ["./traccar.run"]
