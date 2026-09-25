require("faust.lazy")
require("faust.remap")
require("faust.lsp")
require("faust.init")

vim.opt.termguicolors = true
vim.opt.splitbelow = true


vim.keymap.set('n', 'K', function()
  local winid = vim.diagnostic.open_float({ focusable = false })
  if not winid then
    vim.lsp.buf.hover()
  end
end, { desc = "Show hover or diagnostic" })

vim.cmd.colorscheme("pfil")
require("faust.set")


require'nvim-treesitter'.install { 'rust', 'javascript', 'c', 'python', 'cpp', 'typescript'}

-- virtual lines
local ns = vim.api.nvim_create_namespace("eof_padding")

local function add_eof_padding()
  local buf = vim.api.nvim_get_current_buf()
  local line_count = vim.api.nvim_buf_line_count(buf)

  vim.api.nvim_buf_clear_namespace(buf, ns, 0, -1)

  for i = 1, 10 do
    vim.api.nvim_buf_set_extmark(buf, ns, line_count - 1, 0, {
      virt_lines = { { { " ", "Normal" } } },
      virt_lines_above = false,
    })
  end
end

vim.api.nvim_create_autocmd({ "BufEnter", "TextChanged", "TextChangedI" }, {
  callback = add_eof_padding,
})
