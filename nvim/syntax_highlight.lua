-- init.lua
-- Syntax highlighting for C++, Python, and Lua
-- No plugin manager required — uses only built-in Neovim APIs

vim.opt.termguicolors = true
vim.opt.syntax       = "on"

-- Enable treesitter-based highlighting for the three languages
-- (Neovim ships with parsers for lua, python, cpp bundled since 0.9)

-- Use the built-in treesitter highlight module directly

-- ─── Colour definitions ───────────────────────────────────────────────────────
-- Palette drawn from a dark indigo/violet theme
local bg0   = "#1A1725"   -- darkest background
local bg1   = "#2A2440"   -- slightly lighter bg
local bg2   = "#3D3060"   -- selection / visual
local fg    = "#DDDAE8"   -- default foreground
local fgdim = "#8B87A8"   -- comments, punctuation

local red     = "#F07070"   -- errors, builtins that mutate
local orange  = "#E89B6A"   -- numbers, constants
local yellow  = "#E8D06A"   -- strings
local green   = "#7EC99A"   -- functions / definitions
local teal    = "#6AB8C9"   -- types, classes
local blue    = "#7AA8E8"   -- keywords
local purple  = "#B07AE8"   -- special keywords (return, yield, self)
local magenta = "#D07AC9"   -- decorators, annotations

-- ─── Helper ──────────────────────────────────────────────────────────────────
local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Base highlights ─────────────────────────────────────────────────────────
hi("Normal",       { fg = fg,     bg = bg0 })
hi("NormalNC",     { fg = fg,     bg = bg0 })
hi("LineNr",       { fg = fgdim,  bg = bg0 })
hi("CursorLineNr", { fg = yellow, bold = true })
hi("CursorLine",   { bg = bg1 })
hi("Visual",       { bg = bg2 })
hi("Comment",      { fg = fgdim,  italic = true })
hi("Constant",     { fg = orange })
hi("String",       { fg = yellow })
hi("Character",    { fg = yellow })
hi("Number",       { fg = orange })
hi("Float",        { fg = orange })
hi("Boolean",      { fg = orange })
hi("Identifier",   { fg = fg })
hi("Function",     { fg = green,  bold = true })
hi("Statement",    { fg = blue })
hi("Keyword",      { fg = blue })
hi("Conditional",  { fg = blue })
hi("Repeat",       { fg = blue })
hi("Label",        { fg = blue })
hi("Operator",     { fg = teal })
hi("Exception",    { fg = red })
hi("PreProc",      { fg = magenta })
hi("Include",      { fg = magenta })
hi("Define",       { fg = magenta })
hi("Macro",        { fg = magenta })
hi("Type",         { fg = teal })
hi("StorageClass", { fg = teal })
hi("Structure",    { fg = teal })
hi("Typedef",      { fg = teal })
hi("Special",      { fg = purple })
hi("SpecialChar",  { fg = purple })
hi("Delimiter",    { fg = fgdim })
hi("Error",        { fg = red,    bold = true })
hi("Todo",         { fg = bg0,    bg = yellow, bold = true })
hi("Underlined",   { underline = true })

-- ─── Treesitter semantic groups ──────────────────────────────────────────────
-- These map to @-prefixed capture names used by nvim's built-in TS highlight

-- keywords
hi("@keyword",             { fg = blue })
hi("@keyword.return",      { fg = purple, italic = true })
hi("@keyword.function",    { fg = blue })
hi("@keyword.operator",    { fg = teal })
hi("@keyword.import",      { fg = magenta })
hi("@conditional",         { fg = blue })
hi("@repeat",              { fg = blue })
hi("@exception",           { fg = red })

-- identifiers
hi("@variable",            { fg = fg })
hi("@variable.builtin",    { fg = purple, italic = true })  -- self, cls, this
hi("@parameter",           { fg = fg,     italic = true })
hi("@field",               { fg = fg })
hi("@property",            { fg = fg })

-- functions
hi("@function",            { fg = green, bold = true })
hi("@function.builtin",    { fg = green })
hi("@function.call",       { fg = green })
hi("@method",              { fg = green, bold = true })
hi("@method.call",         { fg = green })
hi("@constructor",         { fg = teal,  bold = true })

-- types
hi("@type",                { fg = teal })
hi("@type.builtin",        { fg = teal,  italic = true })
hi("@type.definition",     { fg = teal,  bold = true })
hi("@storageclass",        { fg = teal })
hi("@namespace",           { fg = teal })

-- literals
hi("@string",              { fg = yellow })
hi("@string.escape",       { fg = orange })
hi("@string.special",      { fg = orange })
hi("@character",           { fg = yellow })
hi("@number",              { fg = orange })
hi("@float",               { fg = orange })
hi("@boolean",             { fg = orange })

-- punctuation
hi("@punctuation.bracket", { fg = fgdim })
hi("@punctuation.delimiter",{ fg = fgdim })
hi("@punctuation.special", { fg = teal })

-- operators
hi("@operator",            { fg = teal })

-- comments
hi("@comment",             { fg = fgdim, italic = true })

-- preprocessor / macros (C/C++)
hi("@preproc",             { fg = magenta })
hi("@include",             { fg = magenta })
hi("@define",              { fg = magenta })
hi("@macro",               { fg = magenta })
hi("@attribute",           { fg = magenta })  -- [[nodiscard]] etc.

-- special
hi("@constant",            { fg = orange })
hi("@constant.builtin",    { fg = orange, italic = true })  -- None, True, False
hi("@constant.macro",      { fg = magenta })
hi("@label",               { fg = blue })

-- Python-specific
hi("@decorator",           { fg = magenta, italic = true })
hi("@symbol",              { fg = purple })

-- Lua-specific
hi("@field.lua",           { fg = fg })

-- C++ specific
hi("@type.qualifier",      { fg = blue })   -- const, volatile, mutable
hi("@storageclass.cpp",    { fg = teal })

-- ─── UI chrome ───────────────────────────────────────────────────────────────
hi("StatusLine",   { fg = fg,    bg = bg1 })
hi("StatusLineNC", { fg = fgdim, bg = bg0 })
hi("WinSeparator", { fg = bg2,   bg = bg0 })
hi("Pmenu",        { fg = fg,    bg = bg1 })
hi("PmenuSel",     { fg = bg0,   bg = teal })
hi("PmenuSbar",    { bg = bg1 })
hi("PmenuThumb",   { bg = bg2 })
hi("Search",       { fg = bg0,   bg = yellow })
hi("IncSearch",    { fg = bg0,   bg = orange, bold = true })
hi("MatchParen",   { fg = yellow, bold = true, underline = true })
hi("SignColumn",   { bg = bg0 })
hi("ColorColumn",  { bg = bg1 })

-- ─── Filetype detection ───────────────────────────────────────────────────────
vim.filetype.add({
    extension = {
        cpp = "cpp",
        cc  = "cpp",
        cxx = "cpp",
        hpp = "cpp",
        hxx = "cpp",
        py  = "python",
        lua = "lua",
    },
})
