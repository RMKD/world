set -e
BUILD_DIR=`mktemp -d /tmp/dockerception-world.XXXXXX`
docker build -t world-builder .
docker run world-builder > $BUILD_DIR/world.tar
tar -C $BUILD_DIR -xvf $BUILD_DIR/world.tar
docker build -t gzoller/world $BUILD_DIR
rm -r $BUILD_DIR
docker rmi -f world-builder
