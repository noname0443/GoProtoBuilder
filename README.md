The GoProtoBuilder project's primary objective is to offer a ready-made image that enables the generation of.go code with.proto schemes without the need of extra package installations.

It can be used like this:
1. As a builder, i.e.
  - generate .go code from .proto schemas
  - compile the application
  - run it in a separate container without unnecessary libraries.
```Dockerfile
FROM noname0443/go_proto_builder:latest AS builder

ADD ./my-cool-app /build

WORKDIR /build

RUN protoc -I ./grpc_api --go_out=. --go-grpc_out=. ./grpc_folder/*.proto

RUN go build -o app main.go

FROM alpine

WORKDIR /build

COPY --from=builder /build/app /build/app

CMD ["./app"]
```
2. As a ready-made tool for local generation.go code from .proto schemas.
```bash
docker container run -v .:/mnt/grpc noname0443/go_proto_builder /bin/sh -c "cd /mnt/grpc; protoc --go_out=. --go-grpc_out=. ./*.proto"
```
3. As a typical image for your application.
