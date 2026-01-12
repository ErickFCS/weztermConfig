local wezterm = require 'wezterm'

local config = wezterm.config_builder()

local images = {
  "/home/erick/Pictures/WezTerm/aoi.jpg",
  "/home/erick/Pictures/WezTerm/assasin.jpg",
  "/home/erick/Pictures/WezTerm/asuka.jpg",
  "/home/erick/Pictures/WezTerm/blue.jpg",
  "/home/erick/Pictures/WezTerm/cid.jpg",
  "/home/erick/Pictures/WezTerm/eris.jpg",
  "/home/erick/Pictures/WezTerm/hutao.jpg",
  "/home/erick/Pictures/WezTerm/light.jpg",
  "/home/erick/Pictures/WezTerm/makima.jpg",
  "/home/erick/Pictures/WezTerm/nakano1.jpg",
  "/home/erick/Pictures/WezTerm/nakano2.jpg",
  "/home/erick/Pictures/WezTerm/nakano3.jpg",
  "/home/erick/Pictures/WezTerm/nino1.jpg",
  "/home/erick/Pictures/WezTerm/nino2.jpg",
  "/home/erick/Pictures/WezTerm/roxy1.jpg",
  "/home/erick/Pictures/WezTerm/roxy2.jpg",
  "/home/erick/Pictures/WezTerm/shinobu.jpg"
}

local function get_background_image()
  local index = math.random(#images)
  return images[index]
end

config.colors = {
  foreground = '#ffffff',
  tab_bar = {
    background = "#262626",
    active_tab = {
      bg_color = "#202020",
      fg_color = "#ffffff",
    },
    inactive_tab = {
      bg_color = "#101010",
      fg_color = "#ffffff",
    },
    inactive_tab_hover = {
      bg_color = "#3a3a3a",
      fg_color = "#ffffff",
    },
    new_tab = {
      bg_color = "#202020",
      fg_color = "#ffffff",
    },
    new_tab_hover = {
      bg_color = "#3a3a3a",
      fg_color = "#ffffff",
    },
    inactive_tab_edge = "#444444",
  }
}
config.enable_tab_bar = false
config.hide_tab_bar_if_only_one_tab = false
config.use_fancy_tab_bar = true
config.window_decorations = "RESIZE"
config.text_background_opacity = 1.0
config.window_background_opacity = 1.0
-- config.window_background_image = get_background_image()
-- config.window_background_image = nil
config.window_background_image_hsb = {
  brightness = 0.02,
  hue = 1.0,
  saturation = 1.0,
}

config.keys = {
  {
    mods = 'CTRL',
    key = 'B',
    action = wezterm.action_callback(
      function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if overrides.enable_tab_bar then
          overrides.enable_tab_bar = false
        else
          overrides.enable_tab_bar = true
        end
        window:set_config_overrides(overrides)
      end
    )
  },
  {
    mods = 'CTRL',
    key = 'Y',
    action = wezterm.action_callback(
      function(window, pane)
        local overrides = window:get_config_overrides() or {}
        if (overrides.window_background_image) then
          overrides.window_background_image = nil
        else
          overrides.window_background_image = get_background_image()
        end
        window:set_config_overrides(overrides)
      end
    )
  }
}
config.quick_select_patterns = {
  [[[A-Za-z]:\\[^ \t\n>]*]],
}

config.font = wezterm.font_with_fallback({
  "Hack Nerd Font Mono",
})

return config
