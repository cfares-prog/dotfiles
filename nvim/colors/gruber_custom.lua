local M = {}

local c = {
    white        = "#E0E0E0",
    gray         = "#7A7A7A",
    purple       = "#7289DA",
    yellow       = "#ffd700",
    string_green = "#43B581",
    pink         = "#e07cae",
    amber        = "#CC8A00",
    bg_dark      = "#1F2024",
    search_bg    = "#3A3B45",
    search_fg    = "#E0E0E0",
}

local hl = function(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

M.setup = function()
    vim.cmd("highlight clear")
    vim.o.background = "dark"
    vim.g.colors_name = "discord_gruber"

    -- ======================
    -- Common UI
    -- ======================
    hl("Normal",       { fg = c.white, bg = "NONE" })
    hl("Cursor",       { underline = true })
    hl("CursorColumn", { bg = c.bg_dark })
    hl("CursorLine",   { bg = c.search_bg })
    hl("CursorLineNr", { bg = c.yellow, bold = true })
    hl("LineNr",       { fg = c.white })
    hl("SignColumn",   { fg = c.purple })

    -- ======================
    -- Search
    -- ======================
    hl("Search",       { fg = c.yellow, bg = c.search_bg })
    hl("IncSearch",    { fg = c.bg_dark, bg = c.yellow, bold = true })

    -- ======================
    -- UI Elements
    -- ======================
    hl("Visual",      { fg = "black", bg = c.purple })
    hl("MatchParen",  { fg = c.purple, bg = "NONE", bold = true })
    hl("NonText",     { fg = c.gray })
    hl("Whitespace",  { fg = c.gray, italic = false })

    -- ======================
    -- Popup Menu
    -- ======================
    hl("Pmenu",       { fg = c.white, bg = c.bg_dark })
    hl("PmenuSel",    { fg = c.white, bg = c.purple, bold = true })
    hl("PmenuBorder", { fg = c.gray })

    -- ======================
    -- Syntax
    -- ======================
    hl("Comment",    { fg = c.amber, italic = false })
    hl("Constant",   { fg = c.white })
    hl("Function",   { fg = c.white })
    hl("Identifier", { fg = c.white })
    hl("Operator",   { fg = c.gray })
    hl("Statement",  { fg = c.yellow, bold = true })
    hl("Type",       { fg = c.yellow, bold = true })
    hl("Keyword",    { fg = c.yellow, bold = true })
    hl("String",     { fg = c.string_green, italic = false })
    hl("Include",    { fg = c.gray })
    hl("PreProc",    { fg = c.yellow })
    hl("Delimiter",  { fg = c.white })

    -- ======================
    -- Diagnostics
    -- ======================
    hl("DiagnosticError", { fg = "#F04747" })  -- Discord red
    hl("DiagnosticWarn",  { fg = c.yellow })
    hl("DiagnosticInfo",  { fg = c.purple })
    hl("DiagnosticHint",  { fg = c.gray })

    -- ======================
    -- Extra Groups
    -- ======================
    hl("ColorColumn",   { bg = "#3A3B45" })
    hl("NormalFloat",   { bg = "NONE" })
    hl("Number",        { fg = c.purple })
    hl("Boolean",       { fg = c.string_green })
    hl("@variable.parameter.python", { fg = c.pink, bold = true })
end

M.setup()

return M
