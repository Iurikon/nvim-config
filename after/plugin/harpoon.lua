local mark = require("harpoon.mark")
local ui = require("harpoon.ui")

vim.keymap.set("n", "<leader>a", mark.add_file)
vim.keymap.set("n", "<C-e>", ui.toggle_quick_menu)

vim.keymap.set("n", "<C-đ>", function() ui.nav_file(1) end)
vim.keymap.set("n", "<C-ć>", function() ui.nav_file(2) end)
vim.keymap.set("n", "<C-č>", function() ui.nav_file(4) end)
