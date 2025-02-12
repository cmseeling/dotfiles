local icons = require("icons")
local colors = require("colors")
local settings = require("settings")

local memory = sbar.add("graph", "widgets.memory" , 30, {
  position = "right",
  graph = { color = colors.blue },
  background = {
    height = 22,
    color = { alpha = 0 },
    border_color = { alpha = 0 },
    drawing = true,
  },
  icon = { string = icons.memory },
  label = {
    string = "memory ??%",
    font = {
      family = settings.font.numbers,
      style = settings.font.style_map["Bold"],
      size = 14.0,
    },
    align = "right",
    padding_right = 0,
    width = 0,
    y_offset = 4
  },
  padding_right = settings.paddings + 6
})

memory:subscribe("system_stats", function(env)
  -- Also available: env.user_load, env.sys_load
  local load = tonumber(env.RAM_USAGE)
  memory:push({ load / 100. })

  local color = colors.blue
  if load > 30 then
    if load < 60 then
      color = colors.yellow
    elseif load < 80 then
      color = colors.orange
    else
      color = colors.red
    end
  end

  memory:set({
    graph = { color = color },
    label = "" .. env.RAM_USAGE .. "%",
  })
end)

-- Background around the memory item
sbar.add("bracket", "widgets.memory.bracket", { memory.name }, {
  background = { color = colors.bg1 }
})

-- Background around the memory item
sbar.add("item", "widgets.memory.padding", {
  position = "right",
  width = settings.group_paddings
})
