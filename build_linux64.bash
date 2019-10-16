#!/bin/bash

DEPENDS=depends/x86_64-linux-gnu

make -C depends HOST=x86_64-linux-gnu -j$(nproc) && \
    $DEPENDS/native/bin/qmake \
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
    MINIUPNPC_LIB_PATH=$DEPENDS/lib \
    QMAKE_LRELEASE=$DEPENDS/native/bin/lrelease \
    SanDeGo-qt.pro && \
    make -j$(nproc) && \
    strip sandego-qt
