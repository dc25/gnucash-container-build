# Run GnuCash in a container
#
# docker run -it \
#	-e DISPLAY=unix$DISPLAY \
#	-v $XAUTHORITY:/root/.Xauthority \
#	-v /tmp/.X11-unix:/tmp/.X11-unix \
#	gnucash-built:latest
#
# Mount $(pwd) as a volume using: -v $(pwd):/src/files

# FROM docker.io/library/ubuntu:22.04
FROM docker.io/library/ubuntu:23.04
LABEL maintainer "Siddharth Kannan <mail@siddharthkannan.in>"

COPY install_gnucash_dependencies.sh /tmp
RUN /tmp/install_gnucash_dependencies.sh

env WORKAREA /src
env SRCDIR $WORKAREA/gnucash
env BUILDDIR $WORKAREA/build

COPY checkout_gnucash_source.sh /tmp
RUN /tmp/checkout_gnucash_source.sh $SRCDIR 

COPY build_gnucash.sh /tmp
RUN /tmp/build_gnucash.sh $SRCDIR $BUILDDIR

ENTRYPOINT ["/src/build/bin/gnucash"]
