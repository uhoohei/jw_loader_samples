require("app.init")

local MyApp = class("MyApp", cc.mvc.AppBase)

function MyApp:ctor()
    MyApp.super.ctor(self)
    math.newrandomseed()
    cc.Director:getInstance():setAnimationInterval(1 / (CONFIG_FPS_NUMBERS or 30))
    self:init_()
end

function MyApp:init_()
end

function MyApp:run()
    if CC_DISABLE_GLOBAL then
        -- jw.utils.dennyGlobalVariable()
    end
    
    self:enterScene("LoadScene")
end

return MyApp
