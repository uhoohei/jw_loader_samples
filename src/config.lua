
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

UPDATE_PATH = DATA_PATH .. ".loader/"  -- 热更新工作目录
GAME_ENTRANCE = "app.MyApp"  -- APP入口，在热更新完成后会被require
PRE_LOAD_ZIPS = {"framework.zip", "game.zip"}  -- 需要提前加载的LUA代码ZIP包

CC_DISABLE_GLOBAL = true  -- MyApp加载完成之后禁止修改全局变量
