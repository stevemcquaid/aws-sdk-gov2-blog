FROM ubuntu:16.04

MAINTAINER Steve McQuaid <steve@stevemcquaid.com>

ENV VERSION=1.0.0

RUN apt-get update && apt-get upgrade -y && apt-get install -y bash git nano curl golang-go

# RUN apt-get install -y 

# WORKDIR /src

# # Caching large packages to speed up build
# RUN go get -u golang.org/x/crypto/ssh/terminal 
# RUN go get -d -v -u github.com/golang/glog
# RUN go get -d -v -u github.com/aws/aws-sdk-go
# RUN go get -d -v -u k8s.io/kops/upup/pkg/fi

# RUN go get github.com/go-ini/ini
# RUN go get github.com/jmespath/go-jmespath
# RUN go get github.com/aws/aws-sdk-go-v2

# COPY src/ .

# RUN go get -d -v   # "go get -d -v ./..."
# RUN go install -v    # "go install -v ./..."

# CMD ["go", "run"] # ["app"]
