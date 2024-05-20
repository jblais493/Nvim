require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

-- place this in one of your configuration file(s)
local hop = require('hop')
local directions = require('hop.hint').HintDirection
vim.keymap.set('', 'f', function()
  hop.hint_char2({ direction = directions.AFTER_CURSOR, current_line_only = false })
end, {remap=true})
vim.keymap.set('', 'F', function()
  hop.hint_char2({ direction = directions.BEFORE_CURSOR, current_line_only = false })
end, {remap=true})

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
-- convert note to template and remove leading white space
vim.keymap.set("n", "<leader>on", ":ObsidianTemplate note<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")
vim.keymap.set("n", "<leader>od", ":ObsidianTemplate daily<cr> :lua vim.cmd([[1,/^\\S/s/^\\n\\{1,}//]])<cr>")

-- zen mode
vim.keymap.set("n", "<leader>zn", ":ZenMode<cr>")
