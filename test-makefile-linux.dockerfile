FROM ubuntu:latest

COPY Makefile /Makefile

RUN apt-get update && \
    apt-get install -y make wget && \
    apt-get clean && \
    make --version && \
    make && \
    make all

CMD ["echo", "Makefile was tested successfully"]
