-- vim)   
require('modules.vim_new')


-- 1). short key
local bindKey = {"shift","cmd"}
do  -- app manager
  local app_man = require('modules.appman')
  hs.hotkey.bind(bindKey, 'c', app_man:toggle('Google Chrome'))
  hs.hotkey.bind(bindKey, 'j', app_man:toggle('IntelliJ IDEA'))
  hs.hotkey.bind(bindKey, 'v', app_man:toggle('Visual Studio Code'))
  -- hs.hotkey.bind(bindKey, 'n', app_man:toggle('Notes'))
  hs.hotkey.bind(bindKey, 'f', app_man:toggle('Firefox'))
  hs.hotkey.bind(bindKey, 'e', app_man:toggle('Finder'))
  hs.hotkey.bind(bindKey, 'p', app_man:toggle('Preview'))
  hs.hotkey.bind(bindKey, 'a', app_man:toggle('Safari'))
  hs.hotkey.bind(bindKey, 'k', app_man:toggle('KakaoTalk'))
  hs.hotkey.bind(bindKey, 'space', app_man:toggle('iTerm'))
  hs.hotkey.bind({'control','shift'}, 'escape', app_man:toggle('Activity Monitor')) 
end
-- 2 esc, eng
-- hs.hotkey.bind({'shift', 'cmd'}, 'H', function() hs.alert.show('Hello, world!') end)

local inputEnglish = "com.apple.keylayout.ABC"

-- local esc_bind

function back_to_eng()
	local inputSource = hs.keycodes.currentSourceID()
	if not (inputSource == inputEnglish) then
		hs.keycodes.currentSourceID(inputEnglish)
	end
	esc_bind:disable()
	hs.eventtap.keyStroke({}, 'escape')
	esc_bind:enable()
end 
esc_bind = hs.hotkey.new({}, 'escape', back_to_eng):enable()

hs.hotkey.bind({'ctrl'}, '[', function()
  hs.eventtap.keyStroke({}, 'escape')
end)


