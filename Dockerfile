# Run GnuCash in a container
#

FROM docker.io/library/ubuntu:23.04

COPY install_gnucash_dependencies.sh /tmp
RUN /tmp/install_gnucash_dependencies.sh

env WORKAREA /src

COPY build_gnucash.sh /tmp
RUN /tmp/build_gnucash.sh $WORKAREA/gnucash $WORKAREA/build

ENTRYPOINT ["/src/build/bin/gnucash"]
