FROM golang:alpine AS builder
WORKDIR /go/src/challenge
RUN go mod init challenge/app && \
    echo 'package main; import "fmt"; func main() { fmt.Println("Full Cycle Rocks!!") }' > app.go && \
    go build

FROM scratch
COPY --from=builder /go/src/challenge/app ./ 
ENTRYPOINT ["/app"]
