# Start from a Debian image with the latest version of Go installed
# and a workspace (GOPATH) configured at /go.
FROM golang
WORKDIR /go/src/github.com/Andrew-Klaas/jazz-api-demo

ADD . /go/src/github.com/Andrew-Klaas/jazz-api-demo

COPY go.mod ./
COPY go.sum ./
RUN go mod download


# Run the outyet command by default when the container starts.
ENTRYPOINT /go/bin/web-service-gin

# Document that the service listens on port 8080.
EXPOSE 8080

#docker build -t aklaas2/web-service-gin .;docker push aklaas2/web-service-gin:latest


# # syntax=docker/dockerfile:1

# FROM golang:1.16-alpine

# WORKDIR /app

# COPY go.mod ./
# COPY go.sum ./
# RUN go mod download

# COPY *.go ./

# RUN go build -o /docker-gs-ping

# EXPOSE 8080

# CMD [ "/docker-gs-ping" ]