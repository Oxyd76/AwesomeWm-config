-- Standard awesome library
local awful         =   require("awful")
local gears         =   require("gears")
-- Widget and layout library
local wibox         =   require("wibox")

local tasklist      = { mt = {} }


--  Tasklis button
local tasklist_buttons = gears.table.join(awful.button({ }, 1, function (c)
                if c == client.focus then  c.minimized = true
                    else c:emit_signal("request::activate","tasklist",{raise = true})
                    end
                end))

-- tasklist
function tasklist.new(s)
    local widget = awful.widget.tasklist {
        screen  = s,
        filter  = awful.widget.tasklist.filter.currenttags,
        buttons = tasklist_buttons,
        layout   = {
            spacing = 10,
            layout  = wibox.layout.flex.horizontal
        },
    }
    return widget
end

function tasklist.mt:__call(...)
	return tasklist.new(...)
end

return setmetatable(tasklist, tasklist.mt)