FROM golang:alpine AS builder
WORKDIR /
RUN apk add git make &&\
    git clone https://github.com/p4gefau1t/trojan-go.git &&\
    cd trojan-go &&\
    make &&\
    wget https://github.com/v2ray/domain-list-community/raw/release/dlc.dat -O build/geosite.dat &&\
    wget https://github.com/v2ray/geoip/raw/release/geoip.dat -O build/geoip.dat

FROM alpine
WORKDIR /
COPY --from=builder /trojan-go/build /usr/local/bin/

EXPOSE 3000

ADD trojan.sh /trojan.sh
RUN chmod +x /trojan.sh
CMD /trojan.sh
