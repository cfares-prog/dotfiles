-- colors/cherry_blossom.lua

local M = {}

local c = {
    white        = "#c0c0c0",
    gray         = "#8b8b8b",
    purple       = "#a17fd6",
    yellow       = "#d8b65f",
    string_green = "#7fcf7f",
    bg_dark      = "#181818",
    search_bg    = "#ffffff",
    search_fg    = "#2f2f2f",
}

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

M.setup = function()
    vim.cmd("highlight clear")
    vim.g.colors_name = "cherry_blossom"

    -- ======================
    -- Common UI
    -- ======================
    hl("Normal",       { fg = c.white, bg = "NONE" })
    hl("Cursor",       { underline = true })
    hl("CursorColumn", { bg = c.bg_dark })
    hl("CursorLine",   { bg = c.bg_dark })
    hl("CursorLineNr", { fg = c.purple, bold = true })
    hl("LineNr",       { fg = c.gray })
    hl("SignColumn",   { fg = c.gray })

    -- ======================
    -- Search
    -- ======================
    hl("Search",     { fg = c.search_fg, bg = c.search_bg })
    hl("IncSearch",  { fg = c.search_fg, bg = c.yellow, bold = true })

    -- ======================
    -- UI Elements
    -- ======================
    hl("Visual",      { fg = "black", bg = c.search_bg })
    hl("MatchParen",  { fg = c.white, bg = "NONE", bold = true })
    hl("NonText",     { fg = c.gray })
    hl("Whitespace",  { fg = c.gray, italic = false })

    -- ======================
    -- Popup Menu
    -- ======================
    hl("Pmenu",       { fg = c.white, bg = c.bg_dark })
    hl("PmenuSel",    { fg = c.search_fg, bg = c.search_bg, bold = true })
    hl("PmenuBorder", { fg = c.gray })

    -- ======================
    -- Syntax
    -- ======================
    hl("Comment",    { fg = c.gray, italic = false })
    hl("Constant",   { fg = c.white })
    hl("Function",   { fg = c.yellow })
    hl("Identifier", { fg = c.white })
    hl("Operator",   { fg = c.gray })
    hl("Statement",  { fg = c.gray, bold = true })
    hl("Type",       { fg = c.white, bold = true })
    hl("Keyword",    { fg = c.yellow, bold = true })
    hl("String",     { fg = c.string_green, italic = false })
    hl("Include",    { fg = c.purple })
    hl("PreProc",    { fg = c.yellow })
    hl("Delimiter",  { fg = c.purple })
    hl("@punctuation.bracket", { link = "Delimiter" })
    hl("@punctuation.delimiter", { link = "Delimiter" })

    -- ======================
    -- Diagnostics
    -- ======================
    hl("DiagnosticError", { fg = "#D87C7C" })
    hl("DiagnosticWarn",  { fg = c.yellow })
    hl("DiagnosticInfo",  { fg = c.gray })
    hl("DiagnosticHint",  { fg = c.gray })

    -- ======================
    -- Extra Groups
    -- ======================
    hl("ColorColumn",   { bg = "#3A3F52" })
    hl("NormalFloat",   { bg = "NONE" })
    hl("Number",        { fg = c.gray })
    hl("Boolean",       { fg = c.gray })
    hl("@variable.parameter.python", { fg = c.gray, bold = true })
end

M.setup()

return M
