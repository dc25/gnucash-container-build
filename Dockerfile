# Build/Install/Run GnuCash in a container
#
# Using aliases from "aliases" file, run with:
# crun gc gnucash
# (where "gc" is the name of the image build)
#

# Choose a base
FROM docker.io/library/ubuntu:22.04
# FROM docker.io/library/ubuntu:23.04

# Install required utilities and libraries
# This is done as individual RUN commands to facilitate 
# starting over at point of failure (in case of failure).

RUN apt update -y 
RUN apt upgrade -y 

RUN apt install -y git 
RUN apt install -y gettext 
RUN apt install -y wget 
RUN apt install -y libglib2.0-dev 
RUN apt install -y pkg-config 
RUN apt install -y cmake 
RUN apt install -y gcc 
RUN apt install -y g++ 
RUN apt install -y libxml2-dev 
RUN apt install -y libxslt1-dev 
RUN apt install -y xsltproc 
RUN apt install -y swig 
RUN apt install -y guile-2.2-dev 
RUN apt install -y gwenhywfar-tools 
RUN apt install -y libofx-dev 
RUN apt install -y libgtest-dev 
RUN apt install -y libdbi-dev 
RUN apt install -y libxml2-utils 
RUN apt install -y libwebkit2gtk-4.1-dev 
RUN apt install -y libboost-dev 
RUN apt install -y libboost-date-time-dev 
RUN apt install -y libboost-filesystem-dev 
RUN apt install -y libboost-locale-dev 
RUN apt install -y libboost-regex-dev 
RUN apt install -y libboost-program-options-dev 
RUN apt install -y libboost-system-dev 
RUN apt install -y libdbd-sqlite3 
RUN apt install -y libgwenhywfar-core-dev 
RUN apt install -y libaqbanking-dev 
RUN apt install -y libgwengui-gtk3-dev 

# configuration variables
env WORKAREA /src
env BUILDDIR $WORKAREA/build
env SRCDIR $WORKAREA/gnucash

# get the source
RUN git clone https://github.com/Gnucash/gnucash.git $SRCDIR

# build and install
RUN mkdir -p $BUILDDIR
WORKDIR $BUILDDIR
RUN cmake $SRCDIR
RUN make 
RUN make install

