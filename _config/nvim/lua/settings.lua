settings = {
  -- Line numbers
  number = true,

  -- New panes should split horizontally to the right, and vertically below
  splitright = true,
  splitbelow = true,

  -- Highlight a column at 80 lines
  colorcolumn = '80',

  -- Use spaces instead of tabs
  expandtab   = true,
  shiftwidth  = 2,
  softtabstop = 2,

  -- Show extraneous whitespace.
  list      = true,
  listchars = 'tab:→ ,trail:·,extends:…,precedes:…',

  -- Reload files if they get changed.
  autoread = true,

  -- Wrap long lines.
  linebreak = true,

  -- These come from coc.nvim. I don't understand what they do entirely.
  -- "TextEdit might fail if hidden is not set."
  -- hidden = true,

  -- "Give more space for displaying messages."
  cmdheight = 2,

  -- "Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
  -- delays and poor user experience."
  updatetime = 300,

  -- "Always show the signcolumn, otherwise it would shift the text each time
  -- diagnostics appear/become resolved."
  signcolumn = 'yes'
}

for key, val in pairs(settings) do
  vim.o[key] = val
end

vim.fn.sign_define('LightBulbSign', { text = "", texthl = "LspDiagnosticsDefaultInformation"})

return true
