#!/bin/bash
if [ "$1" == "--help" ]; then
  echo "Usage: ./build.sh [image_name]"
else
  if [ -n $1 ]; then
    IMAGE=geth
  else
    IMAGE=$1
  fi
  BUILD_DIR=`mktemp -d /tmp/dockerception-$IMAGE.XXXXXX`
  docker build --rm -t $IMAGE-builder -f Dockerfile.build .
  docker run --rm $IMAGE-builder > $BUILD_DIR/$IMAGE.tar
  tar -C $BUILD_DIR -xvf $BUILD_DIR/$IMAGE.tar
  docker build --rm -t $IMAGE:busybox $BUILD_DIR
  rm -r $BUILD_DIR
fi
