# quick-cocos2d-x 热更新项目 jw_loader 的示例工程 jw_loader_samples

## 使用步骤：

1. 安装 quick-cocos2d-x 3.3
2. 下载关联的热更工程 https://github.com/uhoohei/jw_loader.git
3. 运行本示例的根目录下的 loader_build.sh 来编译 loader.zip 文件，编译成功的话此文件直接进入 res 目录。
4. 我们自己的游戏会在此时编译 quick 的frameworks，此步骤可选，不过建议是打包，不然碎文件太多，后面生成的索引文件就比较大
5. 运行项目根目录下的 ./make_update_files.py [W] 脚本来生成客户端检测文件所需要的索引文件，运行成功后会在 res目录下放置一个 resindex.txt 的索引文件，同时会在项目根目录下的 update_build 目录下生成所有文件的MD5形式的文件
6. 可以尝试使用了


## 热更的关键参数说明

### 游戏ID，不同的游戏以此作为区别
文件：src/config.lua
变量名：GAME_ID
它由客户端定义并使用，同时也被 make_update_files.py 所读取

### 主版本号
文件：src/config.lua
变量名：VERSION_HOST
主版本号在脚本里面有定义，在安卓的清单文件中也有定义，在IOS的PLIST中也有定义，脚本里面的只是基本值，它同时也需要被 make_update_files.py 所读取，版本号的第一位数字是主版本，热更时会判断此值，***不允许跨主版本***进行热更，即不允许从1.XX热更到2.XX

### 分支ID
文件：src/config.lua
变量名：BRANCH_ID
分支ID的定义和作用是为了区别不同的第三方平台或SDK，有时候为了发布某些渠道，可能要接入他们的SDK，这样的
话他们的代码与主分支可能稍有不同，此时为了区别更新，引入了分支ID的概念

### 脚本版本ID
文件：src/app/const.lua
变量名：SCRIPT_VERSION_ID
脚本版本ID是唯一用来比较判断是否有新版本的变量，当线上版本大于本地版本时，才有后续的热更流程，
每一次发布热更版本都必须改变此值并用热更的打包脚本进行编译

### UPDATE_PATH
更新的工作路径

### GAME_ENTRANCE
游戏的真正入口，热更完成后会加载此入口文件并new出来进行真正的进入游戏的过程

### 环境ID
此处定义了四个 
* w: 正式环境
* v: 审核环境
* t: 测试环境
* n: 内网开发环境
执行 py 脚本生成索引时，一定要注意此项

## 热更的打包流程

执行完通用的脚本编译流程之后，
再执行工程根目录下的 make_update_files.py, 
此脚本需要输入当前是为哪个环境所编译资源，具体可看命令行提示

执行完后 make_update_files.py 后，
将所生成的 update_build 目录下的指定目录的文件传给服务器管理人员，由他们更新发布

## Native 工程说明
本示例中只有脚本部分的内容
IOS与ANDROID都需要一些NATIVE的代码来实现获得NATIVE的环境ID，NATIVE的原生版本号等。
这部分网上很多，每个人的实现都有些不同，这里不提供，这部分的配置请参考 main.lua 中的注释进行说明

## 关于quick-cocos2d-x 3.6 的版本说明
这套热更原来是匹配 3.3 ，目前我也在用 3.6 社区版，主要的变化在于，3.6 主推LUAJIT，而IOS的32位64位对于热更的包判断不太好处理，所以我自己用的是稍微修改过的 3.6.3，你也可以自己动手修改一下，将社区的 LUAJIT 改成 使用 LUAC ，则也可以运行。


