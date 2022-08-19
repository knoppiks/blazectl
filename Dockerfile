FROM golang:1.18-alpine AS build

WORKDIR /app
COPY . .

RUN go build -v

FROM alpine:3.16

COPY --from=build /app/blazectl /usr/local/bin/blazectl

CMD ["/usr/local/bin/blazectl"]
