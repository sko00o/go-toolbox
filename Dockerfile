FROM golang:1.19

RUN apt-get update

# install ftp
RUN apt-get install -y ftp

ENV GO111MODULE=on
ENV GOPROXY=https://goproxy.io,direct
ENV GOSUMDB=gosum.io+ce6e7565+AY5qEHUk/qmHc5btzW45JVoENfazw8LielDsaI+lEbq6

# HDFS client
RUN go install github.com/colinmarc/hdfs/v2/cmd/hdfs@latest

# Kafka consumer/producer
RUN go install github.com/sko00o/kafka/example-kafka-go/consumer@latest
RUN go install github.com/sko00o/kafka/example-kafka-go/producer@latest

# nsq
RUN git clone https://github.com/nsqio/nsq && cd nsq && make
RUN rm -rf nsq

ENTRYPOINT ["/bin/bash"]
CMD ["-c", "while true; do sleep 1; done"]
