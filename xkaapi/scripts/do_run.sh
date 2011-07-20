#!/usr/bin/env sh

# numactl
case `hostname` in
    dell)
	NUMACTL_CMD='' ;
	;;
    *)
	NUMACTL_CMD='numactl --interleave=all' ;
	;;
    esac

# cpuset
CPUSET='0'
[ "$1" -eq '0' ] || CPUSET=0:$1 ;

# run
ODE_ROOT=$HOME/repo/opende_kaapi
(
    cd $ODE_ROOT/ode/demo ;

    LD_LIBRARY_PATH=$HOME/install/xkaapi_rose/lib \
    KAAPI_STACKSIZE=268435456 \
    KAAPI_CPUSET=$CPUSET \
    $NUMACTL_CMD \
    ./demo_space_stress -notex -noshadow
)
