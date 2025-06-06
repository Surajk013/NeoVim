vim.g.base46_cache = vim.fn.stdpath "data" .. "/base46/"
vim.g.mapleader = " "

-- bootstrap lazy and all plugins
local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"

if not vim.uv.fs_stat(lazypath) then
  local repo = "https://github.com/folke/lazy.nvim.git"
  vim.fn.system { "git", "clone", "--filter=blob:none", repo, "--branch=stable", lazypath }
end

vim.opt.rtp:prepend(lazypath)

vim.cmd([[
  highlight TabLine guibg=#1e1e2e guifg=#cdd6f4
  highlight TabLineSel guibg=#89b4fa guifg=#1e1e2e
  "highlight TabLineFill guibg=#ffffff guifg=#ffffff
]])

local lazy_config = require "configs.lazy"

-- auto-format 
   vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    vim.lsp.buf.format()
  end,
})


-- load plugins

require("lazy").setup({
  {
    "NvChad/NvChad",
    lazy = false,
    branch = "v2.5",
    import = "nvchad.plugins",
  },

  { import = "plugins" },
}, lazy_config)

-- load theme
dofile(vim.g.base46_cache .. "defaults")
dofile(vim.g.base46_cache .. "statusline")

require "options"
require "nvchad.autocmds"

vim.schedule(function()
  require "mappings"
end)


-- multiple cursors


vim.g.VM_maps = {
    ['Add Cursor Up'] = '<C-S-Up>',
    ['Add Cursor Down'] = '<C-S-Down>',
}

-- Fix: Wrap these in vim.cmd
vim.cmd([[
  autocmd FileType help setlocal modifiable
  autocmd FileType markdown setlocal modifiable
  autocmd BufEnter * setlocal modifiable
]])

-- Auto-save on InsertLeave and TextChanged events
vim.cmd([[
  augroup autosave
    autocmd!
    autocmd InsertLeave,TextChanged * silent! wall
  augroup end
]])


-- keyboard shortcuts

-- Automatically close the nvimtree when a file is opened
 vim.api.nvim_set_keymap('n', '<CR>', ':NvimTreeFindFile<CR>:NvimTreeClose<CR>', { noremap = true, silent = true })

-- maps 'leader'tt'' for toggline the tabline 
  vim.api.nvim_set_keymap('n','<leader>tt', [[:lua vim.o.showtabline = vim.o.showtabline == 2 and 0 or 2 <CR>]], {noremap=true,silent=true})

-- shift select 
vim.opt.mouse = "a"
vim.opt.keymodel = "startsel,stopsel"


-- Switch to the next tab with Ctrl + Shift + Tab
vim.api.nvim_set_keymap('n', '<C-S-Tab>', ':tabprevious<CR>', { noremap = true, silent = true })  -- Go to the previous tab

-- Switch to the previous tab with Ctrl + Tab
vim.api.nvim_set_keymap('n', '<C-Tab>', ':tabnext<CR>', { noremap = true, silent = true })  -- Go to the next tab

-- Go to the first tab with Ctrl + Shift + 1
vim.api.nvim_set_keymap('n', '<C-S-1>', ':tabn 1<CR>', { noremap = true, silent = true })

-- Go to the second tab with Ctrl + Shift + 2
vim.api.nvim_set_keymap('n', '<C-S-2>', ':tabn 2<CR>', { noremap = true, silent = true })

-- Continue for other tabs as needed
vim.api.nvim_set_keymap('n', '<C-S-3>', ':tabn 3<CR>', { noremap = true, silent = true })
vim.api.nvim_set_keymap('n', '<C-S-4>', ':tabn 4<CR>', { noremap = true, silent = true })

-- copy line down
vim.api.nvim_set_keymap('n', '<C-Down>', 'yyp', { noremap = true, silent = true })


