#!/bin/sh

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
SCRIPTS_DIR=$DIR/src
DEST_DIR=$DIR/.data
TARGET_FILE=game

if [ ! $1 ]; then
    echo "用法：./game_build.sh w|t(正式｜测试环境标识)"
    exit;
fi

COMPILE_BIN=$QUICK_V3_ROOT/quick/bin/compile_scripts.sh 

mkdir $DEST_DIR

# 编译游戏脚本文件
file32=$TARGET_FILE"32.zip"
file64=$TARGET_FILE"64.zip"
rm -f $DEST_DIR/$file32
rm -f $DEST_DIR/$file64

# TODO: 在这里修改你的项目的加密密码，不得超过16位，记得也修改encrypt_res.py脚本中的资源的密码
PASSWORD=TODO_SET_PWD
ENCRYPT_COMMAND=" -e xxtea_zip -ek $PASSWORD -es YOUR_SIGN "

$COMPILE_BIN -b 32 -i $SCRIPTS_DIR -o $DEST_DIR/$file32 $ENCRYPT_COMMAND
$COMPILE_BIN -b 64 -i $SCRIPTS_DIR -o $DEST_DIR/$file64 $ENCRYPT_COMMAND

# 编译入口文件
source $DIR/init_build.sh $PASSWORD

build_path=$DIR"/build/"
rm -rf $build_path
mkdir -p $build_path

python $DIR/encrypt_res.py

cp -rf "$DIR"/.data/*32.zip $build_path/res/
cp -rf "$DIR"/.data/*64.zip $build_path/res/

python $DIR/make_update_files.py $1
