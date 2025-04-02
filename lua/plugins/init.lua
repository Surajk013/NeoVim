return {
  -- Formatter plugin (Conform.nvim) for automatic formatting
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- Run on save
    opts = require("configs.conform"),
  },

  -- LSP configuration
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("configs.lspconfig") -- Loads custom LSP settings
    end,
  },

  -- Utility library for other plugins
  { "NvChad/volt" },

  -- Typing speed tracker (Typr)
  {
    "nvzone/typr",
    dependencies = { "NvChad/volt" }, -- Dependencies should be in a table
    config = function()
      require("typr").setup()
    end,
    opts = {},
    cmd = { "Typr", "TyprStats" },
  },

  -- Treesitter for advanced syntax highlighting
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup({
        ensure_installed = "all", -- Install all available languages
        highlight = { enable = true, additional_vim_regex_highlighting = false }, -- Enable syntax highlighting
        index = {enable=true},
        rainbow = {enable=true},

      })
    end,
  },
 -- This is used to add color brackets
}
