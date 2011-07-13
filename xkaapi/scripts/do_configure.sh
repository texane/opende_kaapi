#!/usr/bin/env sh

ODE_ROOT=$HOME/repo/opende.git

LD_LIBRARY_PATH="$HOME/install/xkaapi_rose/lib" \
LDFLAGS="-L$HOME/install/xkaapi_rose/lib" \
LIBS="-lkaapi" \
$ODE_ROOT/configure --prefix=$HOME/tmp/install
