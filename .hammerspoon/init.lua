-- System Preferences > Security & Privacy > Privacy tab > Accessibility
--- check the box to allow Hammerspoon to control your computer

--- A closure function
function open(name)
    return function()
        hs.application.launchOrFocus(name)
        if name == 'Finder' then
            hs.appfinder.appFromName(name):activate()
        end
    end
end

--- quick open applications
hs.hotkey.bind({"command"}, "1", open("Google Chrome"))
hs.hotkey.bind({"command"}, "2", open("iTerm"))
hs.hotkey.bind({"command"}, "3", open("Terminal"))
hs.hotkey.bind({"command"}, "4", open("iTermVim"))
hs.hotkey.bind({"command"}, "5", open("iTermNotes"))

-- Window management
-- Resize current window

function winresize(how)
   local win = hs.window.frontmostWindow()
   win:maximize()
end

hs.hotkey.bind({"command"}, "6", hs.fnutils.partial(winresize, "max"))

function maximize()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local screen = win:screen()
  local max = screen:frame()
  f.x = max.x
  f.y = max.y
  f.w = max.w
  f.h = max.h
  win:setFrame(f, 0)
end

hs.hotkey.bind({"alt", "command"}, "1", maximize)

hs.hotkey.bind({"cmd", "alt", "ctrl"}, "Left", function()
  local win = hs.window.focusedWindow()
  local f = win:frame()
  local max = win:screen():frame()

  f.x = max.x
  f.y = max.y
  f.w = max.w / 2
  f.h = max.h
  win:setFrame(f, 0)
end)

