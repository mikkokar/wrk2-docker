FROM alpine:3.9

ENV APP_HOME=/wrk2

WORKDIR ${APP_HOME}

RUN apk add --update alpine-sdk openssl-dev zlib-dev \
    && apk add --no-cache git \
    && git clone https://github.com/giltene/wrk2.git \
    && cd wrk2 \
    && make \
    && cp wrk .. \
    && cd .. \
    && rm -rf wrk2

ENTRYPOINT ["/wrk2/wrk"]
