FROM golang:1.15 AS builder
WORKDIR /app
COPY . .
RUN go mod download
RUN CGO_ENABLED=0 go build -a -installsuffix cgo -o /go/app main.go

FROM scratch
COPY --from=builder /go/app /go/app
CMD ["/go/app"]