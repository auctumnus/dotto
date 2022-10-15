-- Sets the vim.g.terminal_color_NN variables.
-- Ideally, this should be updated by pywal ... but I'm lazy.

function mysplit (inputstr, sep)
   if sep == nil then
      sep = "%s"
   end
   local t={}
   for str in string.gmatch(inputstr, "([^"..sep.."]+)") do
      table.insert(t, str)
   end
   return t
 end

local colors_file = io.open('/home/auctumnus/.cache/wal/colors')

local colors_contents = colors_file:read("*a")

local colors = mysplit(colors_contents)

for i, v in ipairs(colors) do
  vim.g['terminal_color_'..(i - 1)] = v
end

return colors
