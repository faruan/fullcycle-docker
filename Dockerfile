FROM golang:1.16 as build

WORKDIR /app

COPY *.go ./
RUN go build main.go

FROM scratch

COPY --from=build /app/main /app/main

ENTRYPOINT [ "/app/main" ]

