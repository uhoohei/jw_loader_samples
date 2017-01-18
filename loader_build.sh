#!/bin/sh

# 这是个更新 loader.zip 的快捷工具，请注意自己的路径

MY_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
MY_DEST_DIR=$MY_DIR/res

source $MY_DIR/../jw_loader/build.sh

echo "mv $MY_DIR/../jw_loader/loader.zip $MY_DEST_DIR/"
mv $MY_DIR/../jw_loader/loader.zip $MY_DEST_DIR/
