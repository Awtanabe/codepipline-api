FROM golang:1.23 as builder


WORKDIR /app

COPY go.mod go.sum ./

RUN go mod download

COPY . .
RUN GOARCH=amd64 GOOS=linux go build -o main /app/main.go

EXPOSE 8080

CMD ["./main"]