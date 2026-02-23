local wezterm = require 'wezterm'
local appearance = require 'appearance'

local config = wezterm.config_builder()

-- === FONT ===
config.font = wezterm.font('MesloLGS NF')
config.font_size = 14

-- === THEME (auto dark/light) ===
if appearance.is_dark() then
  config.color_scheme = 'Tokyo Night'
else
  config.color_scheme = 'Tokyo Night Day'
end

-- === WINDOW ===
config.initial_cols = 120
config.initial_rows = 28
config.window_decorations = "RESIZE"
config.window_background_opacity = 0.9
config.macos_window_background_blur = 30

-- === PERFORMANCE ===
config.front_end = "WebGpu"
config.max_fps = 120

-- === TAB BAR ===
config.hide_tab_bar_if_only_one_tab = true

-- === KEYBINDINGS ===
config.set_environment_variables = {
  PATH = '/opt/homebrew/bin:' .. os.getenv('PATH'),
}

config.keys = {
  -- OPT+Arrow word navigation
  {
    key = 'LeftArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bb',
  },
  {
    key = 'RightArrow',
    mods = 'OPT',
    action = wezterm.action.SendString '\x1bf',
  },
  -- CMD+, to edit config in nvim
  {
    key = ',',
    mods = 'SUPER',
    action = wezterm.action.SpawnCommandInNewTab {
      cwd = wezterm.home_dir,
      args = { '/opt/homebrew/bin/nvim', wezterm.config_file },
    },
  },
}

-- === STATUS BAR ===
wezterm.on('update-status', function(window, _)
  local SOLID_LEFT_ARROW = utf8.char(0xe0b2)

  local color_scheme = window:effective_config().resolved_palette
  local bg = wezterm.color.parse(color_scheme.background)
  local fg = color_scheme.foreground

  local gradient_to = bg
  local gradient_from
  if appearance.is_dark() then
    gradient_from = gradient_to:lighten(0.2)
  else
    gradient_from = gradient_to:darken(0.2)
  end

  local segments = {
    window:active_workspace(),
    wezterm.strftime('%a %b %-d %H:%M'),
    wezterm.hostname(),
  }

  local gradient = wezterm.color.gradient(
    {
      orientation = 'Horizontal',
      colors = { gradient_from, gradient_to },
    },
    #segments
  )

  local elements = {}

  for i, seg in ipairs(segments) do
    local is_first = i == 1
    if is_first then
      table.insert(elements, { Background = { Color = 'none' } })
    end
    table.insert(elements, { Foreground = { Color = gradient[i] } })
    table.insert(elements, { Text = SOLID_LEFT_ARROW })
    table.insert(elements, { Foreground = { Color = fg } })
    table.insert(elements, { Background = { Color = gradient[i] } })
    table.insert(elements, { Text = ' ' .. seg .. ' ' })
  end

  window:set_right_status(wezterm.format(elements))
end)

return config
