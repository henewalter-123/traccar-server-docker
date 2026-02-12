RUN apt-get update && \
    DEBIAN_FRONTEND=noninteractive apt-get install -y --no-install-recommends curl unzip && \
    curl -L "https://github.com/traccar/traccar/releases/download/v5.9/traccar-linux-x64-5.9.zip" -o traccar.zip && \
    unzip traccar.zip && \
    rm traccar.zip && \
    apt-get remove --purge -y curl unzip && \
    apt-get autoremove -y && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/*
