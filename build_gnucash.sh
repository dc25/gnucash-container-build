#! /bin/bash

SRCDIR=$1
BUILDDIR=$2

mkdir -p $BUILDDIR
cd $BUILDDIR
cmake $SRCDIR
make 
