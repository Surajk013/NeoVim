require "nvchad.mappings"


-- Automatically close the nvimtree when a file is opened
 vim.api.nvim_set_keymap('n', '<CR>', ':NvimTreeFindFile<CR>:NvimTreeClose<CR>', { noremap = true, silent = true })

-- Close the current tab with Ctrl + Shift + Q
vim.api.nvim_set_keymap('n', '<C-S-q>', ':tabclose<CR>', { noremap = true, silent = true })

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
-- map("i", "jk", "<ESC>")

map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")
