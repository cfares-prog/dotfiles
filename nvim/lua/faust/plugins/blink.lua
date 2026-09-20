return{
  'saghen/blink.cmp',
  dependencies = { 'rafamadriz/friendly-snippets' },

  version = '1.*',

  ---@module 'blink.cmp'
  ---@type blink.cmp.Config
  opts = {
    keymap = { preset = 'default' },

    appearance = {
      nerd_font_variant = 'mono'
    },

    completion = {
        documentation = {
            auto_show = true,
            auto_show_delay_ms = 50
        },
},

    sources = {
      default = { 'lsp', 'path', 'snippets', 'buffer' },
    },

    signature = { enabled = true },

    fuzzy = { implementation = "prefer_rust_with_warning" }
  },

  opts_extend = { "sources.default" },

  init = function()
      vim.api.nvim_create_autocmd("LspAttach", {
          group = vim.api.nvim_create_augroup("UserLspConfig", { clear = true }),
          callback = function(args)
              local buf = args.buf

              -- Example: buffer-local LSP keymaps (optional)
              -- vim.keymap.set("n", "gd", vim.lsp.buf.definition, { buffer = buf })
              -- vim.keymap.set("n", "K", vim.lsp.buf.hover, { buffer = buf })
          end,
      })
  end
}
