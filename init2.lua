local inputSource = {
  english = "com.apple.keylayout.ABC",
  korean = "com.apple.inputmethod.Korean.2SetKorean",
  china = "com.apple.inputmethod.SCIM.ITABC",
}



k = hs.hotkey.modal.new('cmd-shift', 'd')
function k:entered() hs.alert'Entered mode' end
function k:exited()  hs.alert'Exited mode'  end
k:bind('', 'escape', function() k:exit() end)
k:bind('', 'J', 'Pressed J',function() print'let the record show that J was pressed' end)


function hello()
  local input_source = hs.keycodes.currentSourceID()
  hs.application.launchOrFocus('IntelliJ IDEA')
  print(input_source)
end




hs.hotkey.bind({}, 'f13', hello)
-- hs.hotkey.bind({'shift', 'cmd'}, 'H', hello)

hs.hotkey.bind({}, 'CAPSLOCK', function()
  hs.alert.show('capslock')
  hs.keycodes.currentSourceID(inputSource.english)
end)

-- hs.hotkey.bind({}, 'escape',function()
--   hs.keycodes.currentSourceID(inputSource.english)
-- end)


do  
  local changeInput = function()
      local current = hs.keycodes.currentSourceID()
      local nextInput = nil
      if current == inputSource.english then
          nextInput = inputSource.korean
      end    
      if current == inputSource.korean then   
          nextInput = inputSource.china
      end    
      if current == inputSource.china then    
          nextInput = inputSource.english   
      end
      hs.keycodes.currentSourceID(nextInput)
  end

  hs.hotkey.bind({}, 'f18', changeInput)
end

bindKey = {"shift","cmd"}
do  -- app manager
  local app_man = require('modules.appman')
  hs.hotkey.bind(bindKey, 'c', app_man:toggle('Google Chrome'))
  hs.hotkey.bind(bindKey, 'j', app_man:toggle('IntelliJ IDEA'))
  hs.hotkey.bind(bindKey, 'v', app_man:toggle('Visual Studio Code'))
  hs.hotkey.bind(bindKey, 'n', app_man:toggle('Notes'))
  hs.hotkey.bind(bindKey, 'f', app_man:toggle('Firefox'))
  hs.hotkey.bind(bindKey, 'e', app_man:toggle('Finder'))
  hs.hotkey.bind(bindKey, 'p', app_man:toggle('Preview'))
  hs.hotkey.bind(bindKey, 'a', app_man:toggle('Safari'))
  hs.hotkey.bind(bindKey, 'k', app_man:toggle('KakaoTalk'))
  hs.hotkey.bind(bindKey, 'space', app_man:toggle('iTerm'))
end