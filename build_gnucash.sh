#! /bin/bash

SRCDIR=$1
BUILDDIR=$2

git clone https://github.com/Gnucash/gnucash.git $SRCDIR

mkdir -p $BUILDDIR
cd $BUILDDIR
cmake $SRCDIR
make 
