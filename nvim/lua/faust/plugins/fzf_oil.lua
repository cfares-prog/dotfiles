return {
  {
    "stevearc/oil.nvim",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    config = function()
      require("oil").setup({
        keymaps = {
          ["-"] = "actions.parent",
        },
      })
      vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory in Oil" })
    end,
  },

  {
    "ibhagwan/fzf-lua",
    dependencies = { "nvim-tree/nvim-web-devicons" },
    opts = {
      files = {
        cmd = "find . -type f",
      },
      fzf_opts = {
        ["--layout"] = "default",
      },
    },
  },

  {
    "ingur/fzf-oil.nvim",
    dependencies = { "ibhagwan/fzf-lua", "stevearc/oil.nvim" },
    config = function()
      local browser = require("fzf-oil").setup({
        keymaps = {
          ["<CR>"]    = "actions.enter",   -- Enter steps into chosen folders
          ["<BS>"]    = "actions.parent",  -- Backspace breaks parent limits to move up a directory
          ["<C-g>"]   = "actions.toggle",  -- Jump cleanly straight into full interactive Oil mode
        }
      })
      
      -- Emacs C-x C-f Find File mapping
      vim.keymap.set({ "n", "i" }, "<C-x><C-f>", function()
        local path = vim.fn.expand("%:p:h")
        if path == "" or path:match("^oil://") then
          path = vim.fn.getcwd()
        end
        
        browser.browse(path, {})
      end, { desc = "Emacs Find File" })
    end,
  }
}
