FROM golang:latest as builder
WORKDIR /challenge
RUN go mod init challenge/hello && \
    echo 'package main\n\nimport "fmt"\n\nfunc main() {\n  fmt.Println("Full Cycle Rocks!!")\n}' > hello.go && \
    go build

FROM alpine:2.6
COPY --from=builder /challenge/hello ./
ENTRYPOINT ./hello
