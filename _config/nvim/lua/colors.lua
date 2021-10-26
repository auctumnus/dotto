-- Sets the vim.g.terminal_color_NN variables.
-- Ideally, this should be updated by pywal ... but I'm lazy.

local colors = {
  '#1f231d',
  '#ac5343',
  '#b3b43d',
  '#a17c52',
  '#798aa0',
  '#8d8d4d',
  '#ceaf94',
  '#eaf2ce',
  '#a39b90',
  '#ac5343',
  '#b3b43d',
  '#a17c52',
  '#798aa0',
  '#8d8d4d',
  '#ceaf94',
  '#eaf2ce'
}

for i, v in ipairs(colors) do
  vim.g['terminal_color_'..(i - 1)] = v
end

return colors
