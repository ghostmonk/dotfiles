local colors = require("colors")
local icons = require("icons")
local settings = require("settings")

local spaces = {}

-- Register the AeroSpace workspace change event
sbar.add("event", "aerospace_workspace_change")

-- Get AeroSpace workspaces dynamically
sbar.exec("aerospace list-workspaces --all", function(result)
  for sid in string.gmatch(result, '[^\r\n]+') do
    local space = sbar.add("item", "space." .. sid, {
      icon = {
        font = {
          family = settings.font.numbers,
          style = settings.font.style_map["Bold"],
          size = 14.0,
        },
        string = sid,
        padding_left = 10,
        padding_right = 10,
        color = colors.grey,
        highlight_color = colors.white,
      },
      label = { drawing = false },
      padding_right = 1,
      padding_left = 1,
      background = {
        color = colors.bg1,
        border_width = 1,
        height = 26,
        border_color = colors.black,
      },
    })

    spaces[sid] = space

    -- Double border bracket
    local space_bracket = sbar.add("bracket", { space.name }, {
      background = {
        color = colors.transparent,
        border_color = colors.bg2,
        height = 28,
        border_width = 2,
      }
    })

    -- Padding
    sbar.add("item", "space.padding." .. sid, {
      width = settings.group_paddings,
    })

    space:subscribe("aerospace_workspace_change", function(env)
      local selected = env.FOCUSED_WORKSPACE == sid
      space:set({
        icon = { highlight = selected },
        background = {
          border_color = selected and colors.black or colors.bg2,
        }
      })
      space_bracket:set({
        background = {
          border_color = selected and colors.grey or colors.bg2,
        }
      })
    end)

    space:subscribe("mouse.clicked", function(env)
      sbar.exec("aerospace workspace " .. sid)
    end)
  end
end)

-- Spaces/menus toggle indicator
local spaces_indicator = sbar.add("item", {
  padding_left = -3,
  padding_right = 0,
  icon = {
    padding_left = 8,
    padding_right = 9,
    color = colors.grey,
    string = icons.switch.on,
  },
  label = {
    width = 0,
    padding_left = 0,
    padding_right = 8,
    string = "Spaces",
    color = colors.bg1,
  },
  background = {
    color = colors.with_alpha(colors.grey, 0.0),
    border_color = colors.with_alpha(colors.bg1, 0.0),
  }
})

spaces_indicator:subscribe("swap_menus_and_spaces", function(env)
  local currently_on = spaces_indicator:query().icon.value == icons.switch.on
  spaces_indicator:set({
    icon = currently_on and icons.switch.off or icons.switch.on
  })
end)

spaces_indicator:subscribe("mouse.entered", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 1.0 },
        border_color = { alpha = 1.0 },
      },
      icon = { color = colors.bg1 },
      label = { width = "dynamic" }
    })
  end)
end)

spaces_indicator:subscribe("mouse.exited", function(env)
  sbar.animate("tanh", 30, function()
    spaces_indicator:set({
      background = {
        color = { alpha = 0.0 },
        border_color = { alpha = 0.0 },
      },
      icon = { color = colors.grey },
      label = { width = 0 },
    })
  end)
end)

spaces_indicator:subscribe("mouse.clicked", function(env)
  sbar.trigger("swap_menus_and_spaces")
end)
