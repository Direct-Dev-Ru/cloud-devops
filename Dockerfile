FROM golang:1.13 as builder

WORKDIR /opt/time-service

COPY main.go /opt/time-service/main.go

RUN CGO_ENABLED=0 GOOS=linux go build -a -o time-service /opt/time-service/main.go

FROM alpine:3.10

EXPOSE 8080

WORKDIR /opt/time-service

COPY --from=builder /opt/time-service/time-service /opt/time-service/time-service

USER 1000

CMD [ "/opt/time-service/time-service" ]