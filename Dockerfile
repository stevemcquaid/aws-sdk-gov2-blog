FROM ubuntu:16.04

MAINTAINER Steve McQuaid <steve@stevemcquaid.com>

ENV VERSION=1.0.0

RUN apt-get update && apt-get upgrade -y && apt-get install -y bash git nano curl

RUN curl -s https://storage.googleapis.com/golang/go1.9.1.linux-amd64.tar.gz | tar -v -C /usr/local -xz

ENV GOROOT $HOME/go

ENV PATH $PATH:$GOROOT/bin

# ENV PATH /usr/local/go/bin:/go/bin:/usr/local/bin:$PATH

WORKDIR /go

ENV GOPATH /go

# Caching large packages to speed up build
RUN go get -u golang.org/x/crypto/ssh/terminal 
RUN go get -d -v -u github.com/golang/glog
RUN go get -d -v -u github.com/aws/aws-sdk-go
RUN go get -d -v -u k8s.io/kops/upup/pkg/fi

RUN go get github.com/go-ini/ini
RUN go get github.com/jmespath/go-jmespath
RUN go get github.com/aws/aws-sdk-go-v2

COPY src/ /go/github.com/stevemcquaid/aws-sdk-giv2-blog/src

RUN go get -d -v   # "go get -d -v ./..."
RUN go install -v    # "go install -v ./..."

CMD ["go", "run"] # ["app"]
