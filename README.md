# quick-cocos2d-x 热更新项目 jw_loader 的示例工程 jw_loader_samples

## 使用步骤：

1. 安装社区版 quick-cocos2d-x 3.6
2. 下载关联的热更工程 https://github.com/uhoohei/jw_loader.git
3. 使用quick创建你的空工程，并删除空工程下的 src res 目录
4. 将samples中的　res src 以及根目录下的所有sh脚本和py脚本拷贝到空工程中
5. 搜索全工程目录，替换TODO_SET_PWD 与　YOUR_SIGN　为你的资源和代码加密密码和加密签名
6. 运行本示例的根目录下的 loader_build.sh 来编译 loader32.zip与loader64.zip 文件，编译成功的话此文件直接进入 res 目录。
7. 运行本示例的根目录下的　framework_build.sh 来编译　quick 的 framework，成功的话可以在res目录下看到 framework32.zip 与 framework64.zip
8. 运行项目根目录下的 ./game_build.sh [w|t] 脚本来生成客户端初始化init32.zip与init64.zip及game32.zip与game64.zip，并生成检测热更文件所需要的索引文件，同时在目录update_build 下生成所有热更所需要的MD5形式的文件
9. 查看下面的“修改工程入口以支持加密加载”一节以支持加密的资源和代码的加载
10. enjoy it!


## 热更的关键参数说明

### 游戏ID，不同的游戏以此作为区别
文件：src/config.lua
变量名：GAME_ID
它由客户端定义并使用，同时也被 make_update_files.py 所读取

### 主版本号
文件：src/config.lua
变量名：VERSION_HOST
主版本号在脚本里面有定义，在安卓的清单文件中也有定义，在IOS的PLIST中也有定义，脚本里面的只是基本值，它同时也需要被 make_update_files.py 所读取，版本号的第一位数字是主版本，热更时会判断此值，***不推荐跨主版本***进行热更，一般用大版本号来表示项目引擎本身的变更，这些变更可能在
脚本层不是兼容的

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
此处定义了2个 
* w: 正式环境
* t: 测试环境
执行 game_build.sh 脚本生成索引时，一定要注意此项

## 热更的打包流程
一般framework_build.sh与loader_build.sh在没有新的变更的时候不需要每次都编译。
先执行工程根目录下的 game_build.sh [w|t]
此脚本需要输入当前是为哪个环境所编译资源，具体可看命令行提示

执行完后成功后，
将所生成的 update_build 目录下的指定目录的文件传给服务器管理人员，由他们更新发布

## Native 工程说明
本示例中只有脚本部分的内容
IOS与ANDROID都需要一些NATIVE的代码来实现获得NATIVE的环境ID，NATIVE的原生版本号等。
这部分网上很多，每个人的实现都有些不同，这里不提供，这部分的配置请参考 main.lua 中的注释进行说明

## 修改工程入口以支持加密加载
修改工程文件 Classes/AppDelegate.cpp，我的3.6.3是从104行开始，以支持资源和代码的加密
**请修改下列SET_YOUR_PWD为你的真实项目密码**
当然你也可以不修改，那样你需要去掉所有脚本中的与加密相关的配置选项
```c++
    FileUtils::getInstance()->setResourceEncryptKeyAndSign("SET_YOUR_PWD", "YOUR_SIGN");
#if 1
    // use luajit bytecode package
    stack->setXXTEAKeyAndSign("SET_YOUR_PWD", "YOUR_SIGN");
    
#ifdef CC_TARGET_OS_IPHONE
    if (sizeof(long) == 4) {
        stack->loadChunksFromZIP("res/init32.zip");
    } else {
        stack->loadChunksFromZIP("res/init64.zip");
    }
#else
    // android, mac, win32, etc
    stack->loadChunksFromZIP("res/init32.zip");
#endif
    stack->executeString("require 'main'");
#else // #if 0
    // use discrete files
    engine->executeScriptFile("src/main.lua");
#endif
```

