#!/usr/bin/env sh

ODE_ROOT=$HOME/repo/opende.git

cd $ODE_ROOT

# remove lib, dotos and demos since we
# dont know about the previous build
rm ode/src/lib* ;
rm ode/src/step.{o,lo,ti} ;
rm ode/demo/demo_step ;

# make the project to build dotos
make ;

case $1 in
    "kaapi" )
    rm ode/src/lib* ;
    rm ode/src/.libs/lib* ;
    rm ode/src/step.{lo,ti} ;
    rm ode/demo/demo_step ;

    rm /tmp/o ;

    CFLAGS="-keep -DdSINGLE -I$PWD/include -I$PWD/ode/src" ;

    (
	cd ode/src ;
	/bin/sh ../../libtool --tag=CXX --mode=compile \
	    $HOME/install/xkaapi_rose/bin/kacc \
	    -DHAVE_CONFIG_H -I.  -I../../include -D__ODE__ \
	    -I../../OPCODE -I../../OPCODE/Ice \
	    -DdTRIMESH_ENABLED -DdTRIMESH_OPCODE -DdSINGLE \
	    -g -O2 -MT step.lo -MD -MP -MF .deps/step.Tpo \
	    -c -o step.lo step.cpp
    )

    /home/texane/install/xkaapi_rose/bin/kacc $CFLAGS \
	-c -o ode/demo/demo_step.o ode/demo/demo_step.cpp ;

    ;;
esac ;

make install ;
