#!/bin/sh

# 引擎编译脚本，负责编译 cocos 和 framework 目录到 res 目录中去

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
DEST_DIR=$DIR/res

#框架的源码包
COCOS_SOURCE=$QUICK_V3_ROOT/quick/cocos
FRAMEWORK_SOURCE=$QUICK_V3_ROOT/quick/framework
TMP_PATH=$QUICK_V3_ROOT/quick/tmp
FRAMEWORK_TARGET=framework.zip


rm -f $DEST_DIR/FRAMEWORK_TARGET
rm -rf $TMP_PATH
mkdir $TMP_PATH
cp -rf $COCOS_SOURCE $TMP_PATH
cp -rf $FRAMEWORK_SOURCE $TMP_PATH

COMPILE_BIN=$QUICK_V3_ROOT/quick/bin/compile_scripts.sh 

# 编译framework脚本文件
$COMPILE_BIN -i $TMP_PATH -o $DEST_DIR/$FRAMEWORK_TARGET
rm -rf $TMP_PATH
