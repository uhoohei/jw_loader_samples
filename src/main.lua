--
--                       _oo0oo_
--                      o8888888o
--                      88" . "88
--                      (| -_- |)
--                      0\  =  /0
--                    ___/`---'\___
--                  .' \\|     |-- '.
--                 / \\|||  :  |||-- \
--                / _||||| -:- |||||- \
--               |   | \\\  -  --/ |   |
--               | \_|  ''\---/''  |_/ |
--               \  .-\__  '-'  ___/-. /
--             ___'. .'  /--.--\  `. .'___
--          ."" '<  `.___\_<|>_/___.' >' "".
--         | | :  `- \`.;`\ _ /`;.`/ - ` : | |
--         \  \ `_.   \_ __\ /__ _/   .-` /  /
--     =====`-.____`.___ \_____/___.-`___.-'=====
--                       `=---='
--
--
--     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
--
--               佛祖保佑         永无BUG
--
--
--

function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    local output = "LUA ERROR: " .. tostring(errorMessage) .. "\n"
    output = output .. debug.traceback("", 2) .. "\n"
    print(output)
    print("----------------------------------------")
    pcall(function () postError(tostring(output)) end)
end

collectgarbage("collect")
collectgarbage("setpause", 1000)
collectgarbage("setstepmul", 50000)

cc.FileUtils:getInstance():addSearchPath("res")
package.path = package.path .. ";src/"
cc.FileUtils:getInstance():setPopupNotify(false)

require("config")

-- run directly.
-- for _,v in ipairs(PRE_LOAD_ZIPS) do
--     cc.LuaLoadChunksFromZIP(v)
-- end
-- require(GAME_ENTRANCE).new():run()

-- run with hot update check.
local configs = {
    bg_sprite_name = "images/login.png",  -- 热更时的背景图
    progress_bg_name = "images/progress_bg.png",  -- 热更进度条的背景资源
    progress_fg_name = "images/progress.png",  -- 热更进度条的前景资源

    app_entrance = GAME_ENTRANCE,   -- 游戏入口，更新完成后需要调用
    work_path = UPDATE_PATH,        -- 更新模块的工作目录
    preload_zips = PRE_LOAD_ZIPS,   -- 需要加载的代码zip文件列表
    design_width = DESIGN_WIDTH,    -- 设计宽
    design_height = DESIGN_HEIGHT,  -- 设计高
    seconds = 600, 					-- 更新超时时间

    zip64 = JIT_BIT,  -- 64还是32位的信息
}
cc.LuaLoadChunksFromZIP("loader" .. JIT_BIT .. ".zip")
require("loader.LoadApp").new(configs):run(true)
