#!/usr/bin/env sh
ODE_ROOT=$HOME/repo/opende.git
(
    cd $ODE_ROOT/ode/demo ;

    LD_LIBRARY_PATH=$HOME/install/xkaapi_rose/lib \
    KAAPI_STACKSIZE=268435456 \
    KAAPI_CPUSET=0:$1 \
    ./demo_step -notex -noshadow
)
