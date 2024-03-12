#!/bin/bash

cd "$(git rev-parse --show-toplevel)"

# Generate the protobuf files
mkdir -p lib/generated
fvm exec protoc --dart_out=grpc:lib/generated --proto_path kachaka-api/protos kachaka-api.proto
