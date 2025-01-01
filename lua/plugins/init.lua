return {
  {
    "stevearc/conform.nvim",
    -- event = 'BufWritePre', -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },


  -- vim-visual-multi
  {
        "mg979/vim-visual-multi",
        --branch = "master",
        config = function()
            -- Optional: Set custom keybindings for multiple cursors
            vim.g.VM_maps = {
                ["Add Cursor Up"] = "<C-S-Up>",
                ["Add Cursor Down"] = "<C-S-Down>",
            }
        end,
    },

  -- {
  -- 	"nvim-treesitter/nvim-treesitter",
  -- 	opts = {
  -- 		ensure_installed = {
  -- 			"vim", "lua", "vimdoc",
  --      "html", "css"
  -- 		},
  -- 	},
  -- },
}
