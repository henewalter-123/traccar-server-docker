FROM openjdk:17-jdk-slim

# Set working directory
WORKDIR /opt/traccar

# Download Traccar
ENV TRACCAR_VERSION=5.9
RUN apt-get update && apt-get install -y curl && \
    curl -L "https://github.com/traccar/traccar/releases/download/v${TRACCAR_VERSION}/traccar-linux-x64-${TRACCAR_VERSION}.zip" -o traccar.zip && \
    apt-get install -y unzip && \
    unzip traccar.zip && \
    rm traccar.zip

# Expose ports
EXPOSE 5055 8082

# Start Traccar
CMD ["sh", "-c", "bin/traccar run"]
