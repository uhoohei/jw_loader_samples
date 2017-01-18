# 注意：请先执行 compile_scripts.sh 编译脚本代码
# 注意：请先执行 compile_scripts.sh 编译脚本代码
# 注意：请先执行 compile_scripts.sh 编译脚本代码

# 这个脚本是用来刷新XCODE中的资源和代码文件的，
# 因为一个已知的XCODE的BUG，在编译时它不知道去更新资源
# 另外就是项目里面的编译方式所致，需要自己处理game.zip的拷贝
# 这个脚本不能直接执行，只能把它的内容，不包含本段注释，复制到它的 Build Phases中的 Run Script 段中

_GAME_BUILD_PATH="$TARGET_BUILD_DIR/$CONTENTS_FOLDER_PATH"
echo "_GAME_BUILD_PATH: $_GAME_BUILD_PATH"
echo "PWD: $PWD"

_DEST_RES_PATH="$_GAME_BUILD_PATH/res/"
_DEST_SRC_PATH="$_GAME_BUILD_PATH/src/"

rm -fr "$_DEST_SRC_PATH"
rm -fr "$_DEST_RES_PATH"

mkdir -p "$_DEST_SRC_PATH"
mkdir -p "$_DEST_RES_PATH"

_ZIP_FILES="*.zip"
_LUA_FILES="*.lua"
rsync -av ${SRCROOT}/../../../res/ "$_DEST_RES_PATH"
rsync -av ${SRCROOT}/../../../.data/${_ZIP_FILES} "$_DEST_RES_PATH"
rsync -av ${SRCROOT}/../../../.data/${_LUA_FILES} "$_DEST_SRC_PATH"

# find ${SRCROOT}/../../../src/ -name "*" -exec touch -cm {} \;
# find ${SRCROOT}/../../../res/ -name "*" -exec touch -cm {} \;
