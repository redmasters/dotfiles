---------------------------
-- Default awesome theme --
---------------------------

local theme_assets = require("beautiful.theme_assets")
local xresources = require("beautiful.xresources")
local dpi = xresources.apply_dpi
local xrdb = xresources.get_current_theme()
local gfs = require("gears.filesystem")
local themes_path = gfs.get_themes_dir()

local theme = {}
local theme_name = "red"


-- This is used to make it easier to align the panels in specific monitor positions
local awful = require("awful")
local screen_width = awful.screen.focused().geometry.width
local screen_height = awful.screen.focused().geometry.height

theme.font = "Roboto Condensed Regular 10"
--theme.tasklist_font = "Roboto 00"
theme.titlebar_font = "Roboto 5"
theme.taglist_font  = "Roboto Bold 6"

--Colors  {

-- Get colors from .Xresources and set fallback colors
theme.xbackground = xrdb.background or "#1D1F28"
theme.xforeground = xrdb.foreground or "#FDFDFD"
theme.xcolor0 = xrdb.color0 or "#282A36"
theme.xcolor1 = xrdb.color1 or "#F37F97"
theme.xcolor2 = xrdb.color2 or "#5ADECD"
theme.xcolor3 = xrdb.color3 or "#F2A272"
theme.xcolor4 = xrdb.color4 or "#8897F4"
theme.xcolor5 = xrdb.color5 or "#C574DD"
theme.xcolor6 = xrdb.color6 or "#79E6F3"
theme.xcolor7 = xrdb.color7 or "#FDFDFD"
theme.xcolor8 = xrdb.color8 or "#414458"
theme.xcolor9 = xrdb.color9 or "#FF4971"
theme.xcolor10 = xrdb.color10 or  "#18E3C8"
theme.xcolor11 = xrdb.color11 or  "#FF8037"
theme.xcolor12 = xrdb.color12 or  "#556FFF"
theme.xcolor13 = xrdb.color13 or  "#B043D1"
theme.xcolor14 = xrdb.color14 or  "#3FDCEE"
theme.xcolor15 = xrdb.color15 or  "#BEBEC1"


-- Set some colors that are used frequently as local variables
local accent_color = theme.xcolor14
local focused_color = theme.xcolor14
local unfocused_color = theme.xcolor7
local urgent_color = theme.xcolor9


-- This is how to get other .Xresources values (beyond colors 0-15, or custom variables)
-- local cool_color = awesome.xrdb_get_value("", "color16")

theme.bg_dark       = theme.xbackground
theme.bg_normal     = theme.xbackground
theme.bg_focus      = theme.xbackground
theme.bg_urgent     = theme.xbackground
theme.bg_minimize   = theme.xbackground
theme.bg_systray    = theme.xbackground

theme.fg_normal     = theme.xcolor7
theme.fg_focus      = focused_color
theme.fg_urgent     = urgent_color
theme.fg_minimize   = theme.xcolor8

--}


--theme.bg_normal     = "#27272f"
--theme.bg_focus      = "#444444"
--theme.bg_urgent     = "#1e1e1e"
--theme.bg_minimize   = "#373740"
--theme.bg_systray    = theme.bg_normal

--theme.fg_normal     = "#aaaaaa"
--theme.fg_focus      = "#ffffff"
--theme.fg_urgent     = "#ffffff"
--theme.fg_minimize   = "#ffffff"

theme.useless_gap   = dpi(3)
theme.border_width  = dpi(1)
theme.screen_margin = dpi(3)
theme.border_normal = "#000000"
theme.border_focus  = "#535d6c"
theme.border_marked = "#91231c"

-- There are other variable sets
-- overriding the default one when
-- defined, the sets are:
-- taglist_[bg|fg]_[focus|urgent|occupied|empty|volatile]
-- tasklist_[bg|fg]_[focus|urgent]
-- titlebar_[bg|fg]_[normal|focus]
-- tooltip_[font|opacity|fg_color|bg_color|border_width|border_color]
-- mouse_finder_[color|timeout|animate_timeout|radius|factor]
-- prompt_[fg|bg|fg_cursor|bg_cursor|font]
-- hotkeys_[bg|fg|border_width|border_color|shape|opacity|modifiers_fg|label_bg|label_fg|group_margin|font|description_font]
-- Example:
--theme.taglist_bg_focus = "#ff0000"

-- Generate taglist squares:
local taglist_square_size = dpi(4)
theme.taglist_squares_sel = theme_assets.taglist_squares_sel(
    taglist_square_size, theme.fg_normal
)
theme.taglist_squares_unsel = theme_assets.taglist_squares_unsel(
    taglist_square_size, theme.fg_normal
)

--Wibar
theme.wibar_height = dpi(45)
--theme.wibar.fg = theme.xcolor7
--theme.wibar.bg = theme.xcolor0 .. "00"

-- Variables set for theming notifications:
-- notification_font
-- notification_[bg|fg]
-- notification_[width|height|margin]
-- notification_[border_color|border_width|shape|opacity]

-- Variables set for theming the menu:
-- menu_[bg|fg]_[normal|focus]
-- menu_[border_color|border_width]
theme.menu_submenu_icon = themes_path.."default/submenu.png"
theme.menu_height = dpi(45)
theme.menu_width  = dpi(100)

-- You can add as many variables as
-- you wish and access them by using
-- beautiful.variable in your rc.lua
--theme.bg_widget = "#cc0000"

-- Define the image to load
theme.titlebar_close_button_normal = themes_path.."red/close_normal.png"
theme.titlebar_close_button_focus  = themes_path.."default/titlebar/close_focus.png"

theme.titlebar_minimize_button_normal = themes_path.."default/titlebar/minimize_normal.png"
theme.titlebar_minimize_button_focus  = themes_path.."default/titlebar/minimize_focus.png"

theme.titlebar_ontop_button_normal_inactive = themes_path.."default/titlebar/ontop_normal_inactive.png"
theme.titlebar_ontop_button_focus_inactive  = themes_path.."default/titlebar/ontop_focus_inactive.png"
theme.titlebar_ontop_button_normal_active = themes_path.."default/titlebar/ontop_normal_active.png"
theme.titlebar_ontop_button_focus_active  = themes_path.."default/titlebar/ontop_focus_active.png"

theme.titlebar_sticky_button_normal_inactive = themes_path.."default/titlebar/sticky_normal_inactive.png"
theme.titlebar_sticky_button_focus_inactive  = themes_path.."default/titlebar/sticky_focus_inactive.png"
theme.titlebar_sticky_button_normal_active = themes_path.."default/titlebar/sticky_normal_active.png"
theme.titlebar_sticky_button_focus_active  = themes_path.."default/titlebar/sticky_focus_active.png"

theme.titlebar_floating_button_normal_inactive = themes_path.."default/titlebar/floating_normal_inactive.png"
theme.titlebar_floating_button_focus_inactive  = themes_path.."default/titlebar/floating_focus_inactive.png"
theme.titlebar_floating_button_normal_active = themes_path.."default/titlebar/floating_normal_active.png"
theme.titlebar_floating_button_focus_active  = themes_path.."default/titlebar/floating_focus_active.png"

theme.titlebar_maximized_button_normal_inactive = themes_path.."default/titlebar/maximized_normal_inactive.png"
theme.titlebar_maximized_button_focus_inactive  = themes_path.."default/titlebar/maximized_focus_inactive.png"
theme.titlebar_maximized_button_normal_active = themes_path.."default/titlebar/maximized_normal_active.png"
theme.titlebar_maximized_button_focus_active  = themes_path.."default/titlebar/maximized_focus_active.png"

theme.wallpaper = themes_path.."red/background.png"


-- You can use your own layout icons like this:
theme.layout_fairh = themes_path.."default/layouts/fairhw.png"
theme.layout_fairv = themes_path.."default/layouts/fairvw.png"
theme.layout_floating  = themes_path.."default/layouts/floatingw.png"
theme.layout_magnifier = themes_path.."default/layouts/magnifierw.png"
theme.layout_max = themes_path.."default/layouts/maxw.png"
theme.layout_fullscreen = themes_path.."default/layouts/fullscreenw.png"
theme.layout_tilebottom = themes_path.."default/layouts/tilebottomw.png"
theme.layout_tileleft   = themes_path.."default/layouts/tileleftw.png"
theme.layout_tile = themes_path.."default/layouts/tilew.png"
theme.layout_tiletop = themes_path.."default/layouts/tiletopw.png"
theme.layout_spiral  = themes_path.."default/layouts/spiralw.png"
theme.layout_dwindle = themes_path.."default/layouts/dwindlew.png"
theme.layout_cornernw = themes_path.."default/layouts/cornernww.png"
theme.layout_cornerne = themes_path.."default/layouts/cornernew.png"
theme.layout_cornersw = themes_path.."default/layouts/cornersww.png"
theme.layout_cornerse = themes_path.."default/layouts/cornersew.png"

-- Generate Awesome icon:
theme.awesome_icon = theme_assets.awesome_icon(
    theme.menu_height, theme.bg_focus, theme.fg_focus
)

-- Define the icon theme for application icons. If not set then the icons
-- from /usr/share/icons and /usr/share/icons/hicolor will be used.
theme.icon_theme = nil

return theme

-- vim: filetype=lua:expandtab:shiftwidth=4:tabstop=8:softtabstop=4:textwidth=80
