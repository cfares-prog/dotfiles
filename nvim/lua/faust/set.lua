vim.opt.guicursor = "n-v-c:block"

vim.opt.number = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.wrap = false

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 10
vim.opt.signcolumn = "yes"

vim.opt.updatetime = 50

vim.api.nvim_set_hl(0, "Normal", { fg = "#ffffff" })
vim.g.mapleader = " "

local accent_yellow  = "#d8b65f"
local string_green   = "#5cdb5c"
local comment_gold   = "#CC8A11"
local eval_white     = "#c5c5c5"
local eval_gray      = "#a1a2a1"
local type_purple    = "#b48ead"

vim.api.nvim_set_hl(0, "Comment", { fg = comment_gold, italic = false })
vim.api.nvim_set_hl(0, "String",  { fg = string_green,  italic = false })
vim.api.nvim_set_hl(0, "Type",    { fg = accent_yellow, bold = true })
vim.api.nvim_set_hl(0, "Keyword", { fg = accent_yellow, bold = true })

vim.api.nvim_set_hl(0, "Variable",   { fg = accent_yellow })
vim.api.nvim_set_hl(0, "Property",   { fg = accent_yellow })
vim.api.nvim_set_hl(0, "Constant",   { fg = accent_yellow })

vim.api.nvim_set_hl(0, "Function",   { fg = eval_gray })
vim.api.nvim_set_hl(0, "Number",   { fg = eval_white })
vim.api.nvim_set_hl(0, "Boolean",  { fg = eval_white })
vim.api.nvim_set_hl(0, "Float",    { fg = eval_white })
vim.api.nvim_set_hl(0, "Identifier", { fg = eval_gray })
vim.api.nvim_set_hl(0, "EndOfBuffer", { fg = "#151515" })

vim.g.zenbones_solid_line_nr = true
vim.g.zenbones_lighten_line_nr = 45

require("oil").setup({
    view_options = {
        show_hidden = true,
    },

    columns = {
        "permissions",
        "size",
        "mtime",
    },
})

vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })
vim.opt.clipboard = "unnamedplus"
vim.diagnostic.config({
    virtual_text = {
        spacing = 4,
        source = "if_many",
        prefix = '>',
        format = function(diagnostic)
            local limit = 40
            if string.len(diagnostic.message) > limit then
                return string.sub(diagnostic.message, 1, limit) .. "..."
            end
            return diagnostic.message
        end,
    },
    underline = true,
    update_in_insert = false,
    severity_sort = true,
    signs = true;
    float = {
        border = 'rounded',
        source = 'always',
    },
})

