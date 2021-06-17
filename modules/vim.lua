local obj = {}

local vim_icon = hs.menubar.new()
local inputEnglish = "com.apple.keylayout.ABC"

local cfg = {
    key_interval = 100,
    icon = { vim = "𝑽", novim = "" },
}

local mode = {
    on        = false,
    triggered = false,
}


function obj:init(mode)

    local function vim_end()
        mode.triggered = true
    end

    self.close = vim_end

    vim_icon:setClickCallback(setVimDisplay)

    hs.fnutils.each({
        { mod={} , key='h' , func=rapidKey({} , 'left')  , repetition=true } ,
        { mod={} , key='j' , func=rapidKey({} , 'down')  , repetition=true } ,
        { mod={} , key='k' , func=rapidKey({} , 'up')    , repetition=true } ,
        { mod={} , key='l' , func=rapidKey({} , 'right') , repetition=true } ,
        { mod={} , key='u' , func=rapidKey({'shift'} , '-') , repetition=true } ,
        { mod={} , key='p' , func=rapidKey({} , 'delete') , repetition=true } ,
        { mod={} , key='d' , func=rapidKey({} , 'forwarddelete') , repetition=true } ,
        { mod={} , key='1' , func=leftClick() , repetition=true } ,
        { mod={} , key='2' , func=rightClick() , repetition=true } ,
        { mod={} , key='w' , func=rapidKey({'alt'} , 'right') , repetition=true } ,
        { mod={} , key='b' , func=rapidKey({'alt'} , 'left') , repetition=true } ,
        { mod={} , key='n' , func=rapidKey({'command'} , 'left') , repetition=true } ,
        { mod={} , key='.' , func=rapidKey({'command'} , 'right') , repetition=true } ,
        { mod={} , key='8' , func=rapidKey({'alt', 'shift'} , 'left') , repetition=true } ,
        { mod={} , key='9' , func=rapidKey({'alt', 'shift' } , 'right') , repetition=true } ,
        { mod={} , key='7' , func=rapidKey({'command','shift'} , 'left') , repetition=true } ,
        { mod={} , key='0' , func=rapidKey({'command', 'shift'} , 'right') , repetition=true } ,
    }, function(v)
        if v.repetition then
            mode:bind(v.mod, v.key, v.func, vim_end, v.func)
        else
            mode:bind(v.mod, v.key, v.func, vim_end)
        end
    end)

    self.on = function()
        mode:enter()
        setVimDisplay(true)
        mode.triggered = false
        mode.on = true
    end

    self.off = function()
        setVimDisplay()
        mode:exit()

        local input_source = hs.keycodes.currentSourceID()

        if not mode.triggered then
            if not (input_source == inputEnglish) then
                hs.eventtap.keyStroke({}, 'right')
                hs.keycodes.currentSourceID(inputEnglish)
                hs.eventtap.keyStroke({}, 'escape')
            end
            hs.eventtap.keyStroke({}, 'escape')
        end

        mode.triggered = true
        mode.on = false
    end

    return self
end

function isInScreen(screen, win)
  return win:screen() == screen
end

function setVimDisplay(state)
    if state then
        vim_icon:setTitle(cfg.icon.vim)
    else
        vim_icon:setTitle(cfg.icon.novim)
    end
end

function rapidKey(modifiers, key)
    modifiers = modifiers or {}
    return function()
        hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), true):post()
        hs.timer.usleep(cfg.key_interval)
        hs.eventtap.event.newKeyEvent(modifiers, string.lower(key), false):post()
    end
end

function inputKey(modifiers, key)
    modifiers = modifiers or {}
    return function()
        hs.eventtap.keyStroke(modifiers, key)
    end
end

function leftClick()
  local ptMouse = hs.mouse.getAbsolutePosition()
  local types = hs.eventtap.event.types
  hs.eventtap.event.newMouseEvent(types.leftMouseDown, ptMouse ):post()
  hs.eventtap.event.newMouseEvent(types.leftMouseUp, ptMouse):post()
end
function rightClick()
  local ptMouse = hs.mouse.getAbsolutePosition()
  local types = hs.eventtap.event.types
  hs.eventtap.event.newMouseEvent(types.rightMouseDown, ptMouse ):post()
  hs.eventtap.event.newMouseEvent(types.rightMouseUp, ptMouse):post()
end

return obj


