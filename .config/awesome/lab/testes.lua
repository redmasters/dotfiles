-- Standard awesome library
local gears = require("gears")
local awful = require("awful")
require("awful.autofocus")
-- Widget and layout library
local wibox = require("wibox")
-- Theme handling library
local beautiful = require("beautiful")
-- Notification library
local naughty = require("naughty")
local menubar = require("menubar")
local hotkeys_popup = require("awful.hotkeys_popup")
-- Enable hotkeys help widget for VIM and other apps
-- when client with a matching name is opened:


wibox.widget {
    {
        max_value     = 1,
        value         = 0.5,
        forced_height = 20,
        forced_width  = 100,
        paddings      = 1,
        border_width  = 1,
        border_color  = beautiful.border_color,
        widget        = wibox.widget.progressbar,
    },
    {
        text   = '50%',
        widget = wibox.widget.textbox,
    },
    layout = wibox.layout.stack
}