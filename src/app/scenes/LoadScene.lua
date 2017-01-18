local LoadScene = class("LoadScene", function()
    return display.newScene("LoadScene")
end)

function LoadScene:ctor()
    display.newSprite("images/login.png"):addTo(self):pos(display.cx, display.cy)
end

function LoadScene:onEnterTransitionFinish()
    local function onButtonClicked(event)
        dump(event)
    end
    device.showAlert("Confirm Exit", "Are you sure exit game ?", {"YES", "NO"}, onButtonClicked)
end

function LoadScene:onExitTransitionStart()
end

function LoadScene:onExit()
end

function LoadScene:onCleanup()
    collectgarbage("collect")
end

return LoadScene
