
-- 0 - disable debug info, 1 - less debug info, 2 - verbose debug info
DEBUG = 1

-- display FPS stats on screen
DEBUG_FPS = false

-- dump memory info every 10 seconds
DEBUG_MEM = false

-- load deprecated API
LOAD_DEPRECATED_API = false

-- load shortcodes API
LOAD_SHORTCODES_API = true

-- screen orientation
CONFIG_SCREEN_ORIENTATION = "landscape"

-- design resolution
CONFIG_SCREEN_WIDTH  = 1280
CONFIG_SCREEN_HEIGHT = 720

-- 屏幕的设计尺寸
DESIGN_WIDTH = 1280
DESIGN_HEIGHT = 720

-- auto scale mode
CONFIG_SCREEN_AUTOSCALE = "FIXED_HEIGHT"
CONFIG_FPS_NUMBERS = 60  			-- 设置帧频

GAME_ID = 111						-- 游戏ID
VERSION_HOST = "2.0"  			-- 整包版本号

GAME_CHANNEL_ID = 1					-- 游戏渠道ID，注意在对应平台会被覆盖
BRANCH_ID = "master"  				-- 脚本代码分支ID

DATA_PATH = cc.FileUtils:getInstance():getWritablePath() .. ".data/" -- 写入文件目录

JIT_BIT = ""
if jit then
	local target = cc.Application:getInstance():getTargetPlatform()
	if target == 0 or target == 1 or target == 2 or target == 3 then
		JIT_BIT = "32"
	elseif string.find(jit.arch, "64") ~= nil then
		JIT_BIT = "64"
	else
		JIT_BIT = "32"
	end
end
UPDATE_PATH = DATA_PATH .. ".loader/"  -- 热更新工作目录
GAME_ENTRANCE = "app.MyApp"  -- APP入口，在热更新完成后会被require
PRE_LOAD_ZIPS = {  -- 进游戏所需要预加载的ZIP列表
	"framework" .. JIT_BIT .. ".zip",
	"game" .. JIT_BIT .. ".zip"
}

CC_DISABLE_GLOBAL = true  -- MyApp加载完成之后禁止修改全局变量
