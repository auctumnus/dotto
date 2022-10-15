local lualine = require('lualine')
local colors = require('colors')

local background = colors[1]
local foreground = colors[16]
local inactive   = colors[9]

local normal  = colors[5]
local replace = colors[4]
local insert  = colors[3]
local visual  = colors[2]

local theme = {
  normal = {
    a = { fg = background, bg = normal, gui = 'bold' },
    b = { fg = inactive, bg = background },
    c = { fg = inactive, bg = background }
  },
  insert  =  { a = { fg = background, bg = insert,     gui = 'bold' } },
  visual  =  { a = { fg = background, bg = visual,     gui = 'bold' } },
  replace =  { a = { fg = background, bg = replace,    gui = 'bold' } },
  inactive = { a = { fg = inactive,   bg = background } }
}

local function progress ()
  local symbols = { }
end

lualine.setup({
  options = {
    theme = theme,
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch', 'filename' },
    lualine_c = { },

    lualine_x = { 'encoding', 'fileformat', 'filetype' },
    lualine_y = { },
    lualine_z = { 'location' }
  },
  extensions = { 'nvim-tree' }
})
