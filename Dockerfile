FROM alpine:latest
LABEL maintainer=Telain
ENV ASPHYXIA_VERSION=1.50
WORKDIR /usr/local/share
COPY --chmod +x bootstrap.sh .
RUN apk add gcompat libgcc libstdc++ &&\
    wget https://github.com/asphyxia-core/asphyxia-core.github.io/releases/download/v${ASPHYXIA_VERSION}/asphyxia-core-linux-x64.zip &&\
    mkdir -p ./asphyxia &&\
    unzip asphyxia-core-linux-x64.zip -d ./asphyxia &&\
    rm *.zip &&\
    chmod -R 774 ./asphyxia
CMD /usr/local/share/bootstrap.sh
