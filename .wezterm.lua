
local wezterm  = require 'wezterm'
local mux = wezterm.mux

wezterm.on('gui-startup', function(window)
  local tab, pane, window = mux.spawn_window(cmd or {})
  local gui_window = window:gui_window();
  gui_window:maximize()
end)

-- this wil hold the config
local config = wezterm.config_builder()

config.color_scheme = 'Gotham (terminal.sexy)'

config.colors = {
    background = 'black'
}

config.window_decorations = 'RESIZE'
config.enable_tab_bar = false

config.font = wezterm.font( 'Hack Nerd Font Mono', { weight = 'Regular' })
config.font_size = 12

config.window_padding = {
    left   = '0px',
    right  = '0px',
    top    = '0px',
    bottom = '0px',
}

config.keys = {
    { key="/", mods="CTRL", action=wezterm.action{SendString="\x1f"} },
    {
        key="6", mods="CTRL|SHIFT",
        action=wezterm.action{SendKey = { key = '6', mods = "CTRL|SHIFT" }}
    },
}

return config
