#!/bin/bash

DEPENDS=depends/x86_64-apple-darwin11
SDK=$HOME/MacOSX10.11.sdk

make -C depends \
    HOST=x86_64-apple-darwin11 \
    DARWIN_SDK_PATH=$SDK \
    -j$(getconf _NPROCESSORS_ONLN) && \
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
    make -j$(getconf _NPROCESSORS_ONLN) && \
    QTDIR=$DEPENDS python contrib/macdeploy/macdeployqtplus SanDeGo-Qt.app -add-qt-tr da,de,es,hu,ru,uk,zh_CN,zh_TW -dmg -fancy contrib/macdeploy/fancy.plist -no-plugins -verbose 3
