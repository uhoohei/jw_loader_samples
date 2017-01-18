#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR=$DIR/src
DEST_DIR=$DIR/.data
TARGET_FILE=game.zip

COMPILE_BIN=$QUICK_V3_ROOT/quick/bin/compile_scripts.sh 

mkdir $DEST_DIR

# 编译游戏脚本文件
rm -f $DEST_DIR/$TARGET_FILE
$COMPILE_BIN -i $SCRIPTS_DIR -o $DEST_DIR/$TARGET_FILE

# 单独编译main与config文件
LUAC_COMPILE=$QUICK_V3_ROOT/quick/bin/mac/luac
rm -f $DEST_DIR/main.lua
rm -f $DEST_DIR/config.lua
$LUAC_COMPILE -o $DEST_DIR/main.lua $SCRIPTS_DIR/main.lua
$LUAC_COMPILE -o $DEST_DIR/config.lua $SCRIPTS_DIR/config.lua
