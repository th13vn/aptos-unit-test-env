FROM --platform=linux/amd64 ubuntu:20.04
WORKDIR /opt

RUN apt-get update && apt-get install -y wget unzip git
RUN wget https://github.com/aptos-labs/aptos-core/releases/download/aptos-cli-v1.0.13/aptos-cli-1.0.13-Ubuntu-x86_64.zip \
    && unzip aptos-cli-1.0.13-Ubuntu-x86_64.zip && rm -f aptos-cli-1.0.13-Ubuntu-x86_64.zip \
    && mv aptos /usr/local/bin/aptos \
    && chmod +x /usr/local/bin/aptos \
    && mkdir -p /TestOnly

WORKDIR /TestOnly
COPY sample/ .
RUN aptos move compile

ENTRYPOINT ["/usr/local/bin/aptos", "move", "test", "--dump"]
