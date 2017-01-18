function __G__TRACKBACK__(errorMessage)
    print("----------------------------------------")
    local output = "LUA ERROR: " .. tostring(errorMessage) .. "\n"
    output = output .. debug.traceback("", 2) .. "\n"
    print(output)
    print("----------------------------------------")
end


require("cocos.init")
require("framework.init")

require("app.const")
