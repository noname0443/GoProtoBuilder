FROM golang:1.21.3-alpine3.18

WORKDIR /tmp

RUN wget https://github.com/protocolbuffers/protobuf/releases/download/v24.4/protoc-24.4-linux-x86_64.zip && \
    unzip protoc-24.4-linux-x86_64.zip -d ./protoc && \
    mv ./protoc/bin/protoc /usr/local/bin/ && \
    go install google.golang.org/protobuf/cmd/protoc-gen-go@v1.28 && \
    go install google.golang.org/grpc/cmd/protoc-gen-go-grpc@v1.2 && \
    go install github.com/srikrsna/protoc-gen-gotag@latest && \
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-grpc-gateway@latest && \
	go install github.com/grpc-ecosystem/grpc-gateway/v2/protoc-gen-openapiv2@latest && \
	wget https://github.com/googleapis/googleapis/archive/refs/heads/master.zip && \
	unzip master.zip -d ./googleapis-master && \
	mkdir /usr/lib/google && \
	mv ./googleapis-master/googleapis-master/google/ /usr/lib/ && \
	mv ./protoc/include/google/* /usr/lib/google/ && \
	rm -rf /tmp/*