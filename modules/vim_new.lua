
local function pressFn(mods, key)
	if key == nil then
		key = mods
		mods = {}
	end

	return function() hs.eventtap.keyStroke(mods, key, 1000) end
end

local function remap(mods, key, pressFn)
	hs.hotkey.bind(mods, key, pressFn, nil, pressFn)	
end


-----hjkl----

remap({'ctrl'}, 'h', pressFn('left'))
remap({'ctrl'}, 'j', pressFn('down'))
remap({'ctrl'}, 'k', pressFn('up'))
remap({'ctrl'}, 'l', pressFn('right'))

remap({'ctrl', 'shift'}, 'h', pressFn({'shift'}, 'left'))
remap({'ctrl', 'shift'}, 'j', pressFn({'shift'}, 'down'))
remap({'ctrl', 'shift'}, 'k', pressFn({'shift'}, 'up'))
remap({'ctrl', 'shift'}, 'l', pressFn({'shift'}, 'right'))

remap({'ctrl', 'cmd'}, 'h', pressFn({'cmd'}, 'left'))
remap({'ctrl', 'cmd'}, 'j', pressFn({'cmd'}, 'down'))
remap({'ctrl', 'cmd'}, 'k', pressFn({'cmd'}, 'up'))
remap({'ctrl', 'cmd'}, 'l', pressFn({'cmd'}, 'right'))

remap({'ctrl', 'alt'}, 'h', pressFn({'alt'}, 'left'))
remap({'ctrl', 'alt'}, 'j', pressFn({'alt'}, 'down'))
remap({'ctrl', 'alt'}, 'k', pressFn({'alt'}, 'up'))
remap({'ctrl', 'alt'}, 'l', pressFn({'alt'}, 'right'))

remap({'ctrl', 'shift', 'cmd'}, 'h', pressFn({'shift', 'cmd'}, 'left'))
remap({'ctrl', 'shift', 'cmd'}, 'j', pressFn({'shift', 'cmd'}, 'down'))
remap({'ctrl', 'shift', 'cmd'}, 'k', pressFn({'shift', 'cmd'}, 'up'))
remap({'ctrl', 'shift', 'cmd'}, 'l', pressFn({'shift', 'cmd'}, 'right'))

remap({'ctrl', 'shift', 'alt'}, 'h', pressFn({'shift', 'alt'}, 'left'))
remap({'ctrl', 'shift', 'alt'}, 'j', pressFn({'shift', 'alt'}, 'down'))
remap({'ctrl', 'shift', 'alt'}, 'k', pressFn({'shift', 'alt'}, 'up'))
remap({'ctrl', 'shift', 'alt'}, 'l', pressFn({'shift', 'alt'}, 'right'))

remap({'ctrl', 'cmd', 'alt'}, 'h', pressFn({'cmd', 'alt'}, 'left'))
remap({'ctrl', 'cmd', 'alt'}, 'j', pressFn({'cmd', 'alt'}, 'down'))
remap({'ctrl', 'cmd', 'alt'}, 'k', pressFn({'cmd', 'alt'}, 'up'))
remap({'ctrl', 'cmd', 'alt'}, 'l', pressFn({'cmd', 'alt'}, 'right'))

remap({'ctrl', 'cmd', 'alt', 'shift'}, 'h', pressFn({'cmd', 'alt', 'shift'}, 'left'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'j', pressFn({'cmd', 'alt', 'shift'}, 'down'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'k', pressFn({'cmd', 'alt', 'shift'}, 'up'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'l', pressFn({'cmd', 'alt', 'shift'}, 'right'))


------wasd----


remap({'ctrl'}, 'a', pressFn('left'))
remap({'ctrl'}, 's', pressFn('down'))
remap({'ctrl'}, 'w', pressFn('up'))
remap({'ctrl'}, 'd', pressFn('right'))

remap({'ctrl', 'shift'}, 'a', pressFn({'shift'}, 'left'))
remap({'ctrl', 'shift'}, 's', pressFn({'shift'}, 'down'))
remap({'ctrl', 'shift'}, 'w', pressFn({'shift'}, 'up'))
remap({'ctrl', 'shift'}, 'd', pressFn({'shift'}, 'right'))

remap({'ctrl', 'cmd'}, 'a', pressFn({'cmd'}, 'left'))
remap({'ctrl', 'cmd'}, 's', pressFn({'cmd'}, 'down'))
remap({'ctrl', 'cmd'}, 'w', pressFn({'cmd'}, 'up'))
remap({'ctrl', 'cmd'}, 'd', pressFn({'cmd'}, 'right'))

remap({'ctrl', 'alt'}, 'a', pressFn({'alt'}, 'left'))
remap({'ctrl', 'alt'}, 's', pressFn({'alt'}, 'down'))
remap({'ctrl', 'alt'}, 'w', pressFn({'alt'}, 'up'))
remap({'ctrl', 'alt'}, 'd', pressFn({'alt'}, 'right'))

remap({'ctrl', 'shift', 'cmd'}, 'a', pressFn({'shift', 'cmd'}, 'left'))
remap({'ctrl', 'shift', 'cmd'}, 's', pressFn({'shift', 'cmd'}, 'down'))
remap({'ctrl', 'shift', 'cmd'}, 'w', pressFn({'shift', 'cmd'}, 'up'))
remap({'ctrl', 'shift', 'cmd'}, 'd', pressFn({'shift', 'cmd'}, 'right'))

remap({'ctrl', 'shift', 'alt'}, 'a', pressFn({'shift', 'alt'}, 'left'))
remap({'ctrl', 'shift', 'alt'}, 's', pressFn({'shift', 'alt'}, 'down'))
remap({'ctrl', 'shift', 'alt'}, 'w', pressFn({'shift', 'alt'}, 'up'))
remap({'ctrl', 'shift', 'alt'}, 'd', pressFn({'shift', 'alt'}, 'right'))

remap({'ctrl', 'cmd', 'alt'}, 'a', pressFn({'cmd', 'alt'}, 'left'))
remap({'ctrl', 'cmd', 'alt'}, 's', pressFn({'cmd', 'alt'}, 'down'))
remap({'ctrl', 'cmd', 'alt'}, 'w', pressFn({'cmd', 'alt'}, 'up'))
remap({'ctrl', 'cmd', 'alt'}, 'd', pressFn({'cmd', 'alt'}, 'right'))

remap({'ctrl', 'cmd', 'alt', 'shift'}, 'a', pressFn({'cmd', 'alt', 'shift'}, 'left'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 's', pressFn({'cmd', 'alt', 'shift'}, 'down'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'w', pressFn({'cmd', 'alt', 'shift'}, 'up'))
remap({'ctrl', 'cmd', 'alt', 'shift'}, 'd', pressFn({'cmd', 'alt', 'shift'}, 'right'))