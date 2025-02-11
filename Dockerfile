FROM golang:1.16.3 as BUILDER

MAINTAINER zengchen1024<chenzeng765@gmail.com>

# build binary
WORKDIR /go/src/github.com/opensourceways/robot-github-openeuler-label
COPY . .
RUN GO111MODULE=on CGO_ENABLED=0 go build -a -o robot-github-openeuler-label .

# copy binary config and utils
FROM alpine:3.14
COPY  --from=BUILDER /go/src/github.com/opensourceways/robot-github-openeuler-label/robot-github-openeuler-label /opt/app/robot-github-openeuler-label

ENTRYPOINT ["/opt/app/robot-github-openeuler-label"]
