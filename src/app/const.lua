
SCRIPT_VERSION_ID = 6  -- 脚本版本ID

HEART_BEAT_SECONDS = 5 -- 心跳时间间隔

CHECK_NETWORK = true  -- 是否开启强制网络检测
if DEBUG < 1 then  -- 正式环境必须要开断网检测
    CHECK_NETWORK = true
end


--[[
....
...
继续写一些全局配置
]]
