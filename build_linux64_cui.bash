#!/bin/bash

DEPENDS=$HOME/SanDeGo/depends/x86_64-linux-gnu

make -C depends HOST=x86_64-linux-gnu -j$(nproc) && \
    make -C src -f makefile.unix \
    STATIC=1 \
    USE_BUILD_INFO=1 \
    BOOST_LIB_SUFFIX=-mt \
    BOOST_THREAD_LIB_SUFFIX=-mt \
    BOOST_INCLUDE_PATH=$DEPENDS/include/boost \
    BOOST_LIB_PATH=$DEPENDS/lib \
    OPENSSL_INCLUDE_PATH=$DEPENDS/include/openssl \
    OPENSSL_LIB_PATH=$DEPENDS/lib \
    BDB_INCLUDE_PATH=$DEPENDS/include \
    BDB_LIB_PATH=$DEPENDS/lib \
    MINIUPNPC_INCLUDE_PATH=$DEPENDS/include \
    MINIUPNPC_LIB_PATH=$DEPENDS/lib && \
    strip src/sandegod
