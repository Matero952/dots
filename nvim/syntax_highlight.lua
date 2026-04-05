-- init.lua — "Ships & Sky" theme
-- Colors sampled from the painting wallpaper

vim.opt.termguicolors = true
vim.opt.syntax       = "on"

-- ─── Palette (sampled from painting) ─────────────────────────────────────────
local bg0   = "#111e2b"   -- darkest ocean shadow
local bg1   = "#1a2a3a"   -- main bg — deep navy
local bg2   = "#243347"   -- selection / visual
local fg    = "#ccd8e0"   -- default fg — pale ocean light
local fgdim = "#5a7a9a"   -- comments — muted ocean blue

local warm    = "#c8a97e"   -- ship hull brown-gold  → keywords
local tan     = "#d4b896"   -- lighter hull/sand     → numbers, constants
local sail    = "#e8e0c8"   -- bright sail white     → functions
local skyhi   = "#b8cfe0"   -- sail highlight blue   → strings
local cobalt  = "#7ab8d4"   -- arch/sea cobalt       → operators, aqua
local midsky  = "#9ecae8"   -- mid painting sky      → types
local cloudhi = "#a8c4d8"   -- cloud edge pale blue  → preprocessor
local foam    = "#d0dce8"   -- wave foam             → builtins (italic)

local function hi(group, opts)
    vim.api.nvim_set_hl(0, group, opts)
end

-- ─── Base ────────────────────────────────────────────────────────────────────
hi("Normal",       { fg = fg,      bg = bg0 })
hi("NormalNC",     { fg = fg,      bg = bg0 })
hi("LineNr",       { fg = fgdim,   bg = bg0 })
hi("CursorLineNr", { fg = sail,    bold = true })
hi("CursorLine",   { bg = bg1 })
hi("Visual",       { bg = bg2 })
hi("Comment",      { fg = fgdim,   italic = true })
hi("Constant",     { fg = tan })
hi("String",       { fg = skyhi })
hi("Character",    { fg = skyhi })
hi("Number",       { fg = tan })
hi("Float",        { fg = tan })
hi("Boolean",      { fg = tan })
hi("Identifier",   { fg = fg })
hi("Function",     { fg = sail,    bold = true })
hi("Statement",    { fg = warm })
hi("Keyword",      { fg = warm })
hi("Conditional",  { fg = warm })
hi("Repeat",       { fg = warm })
hi("Label",        { fg = warm })
hi("Operator",     { fg = cobalt })
hi("Exception",    { fg = warm,    bold = true })
hi("PreProc",      { fg = cloudhi })
hi("Include",      { fg = cloudhi })
hi("Define",       { fg = cloudhi })
hi("Macro",        { fg = cloudhi })
hi("Type",         { fg = midsky })
hi("StorageClass", { fg = midsky })
hi("Structure",    { fg = midsky })
hi("Typedef",      { fg = midsky })
hi("Special",      { fg = cloudhi })
hi("SpecialChar",  { fg = cloudhi })
hi("Delimiter",    { fg = fgdim })
hi("Error",        { fg = warm,    bold = true, underline = true })
hi("Todo",         { fg = bg0,     bg = sail,   bold = true })
hi("Underlined",   { underline = true })

-- ─── Treesitter ──────────────────────────────────────────────────────────────
hi("@keyword",              { fg = warm })
hi("@keyword.return",       { fg = warm,    italic = true })
hi("@keyword.function",     { fg = warm })
hi("@keyword.operator",     { fg = cobalt })
hi("@keyword.import",       { fg = cloudhi })
hi("@conditional",          { fg = warm })
hi("@repeat",               { fg = warm })
hi("@exception",            { fg = warm,    bold = true })

hi("@variable",             { fg = fg })
hi("@variable.builtin",     { fg = foam,    italic = true })  -- self, cls, this
hi("@parameter",            { fg = fg,      italic = true })
hi("@field",                { fg = fg })
hi("@property",             { fg = fg })

hi("@function",             { fg = sail,    bold = true })
hi("@function.builtin",     { fg = sail })
hi("@function.call",        { fg = sail })
hi("@method",               { fg = sail,    bold = true })
hi("@method.call",          { fg = sail })
hi("@constructor",          { fg = midsky,  bold = true })

hi("@type",                 { fg = midsky })
hi("@type.builtin",         { fg = midsky,  italic = true })
hi("@type.definition",      { fg = midsky,  bold = true })
hi("@storageclass",         { fg = midsky })
hi("@namespace",            { fg = fg })

hi("@string",               { fg = skyhi })
hi("@string.escape",        { fg = cobalt })
hi("@string.special",       { fg = cobalt })
hi("@character",            { fg = skyhi })
hi("@number",               { fg = tan })
hi("@float",                { fg = tan })
hi("@boolean",              { fg = tan })

hi("@punctuation.bracket",  { fg = fgdim })
hi("@punctuation.delimiter",{ fg = fgdim })
hi("@punctuation.special",  { fg = cobalt })

hi("@operator",             { fg = cobalt })
hi("@comment",              { fg = fgdim,   italic = true })

hi("@preproc",              { fg = cloudhi })
hi("@include",              { fg = cloudhi })
hi("@define",               { fg = cloudhi })
hi("@macro",                { fg = cloudhi })
hi("@attribute",            { fg = cloudhi })

hi("@constant",             { fg = tan })
hi("@constant.builtin",     { fg = foam,    italic = true })
hi("@constant.macro",       { fg = cloudhi })
hi("@label",                { fg = warm })

hi("@decorator",            { fg = cloudhi, italic = true })
hi("@symbol",               { fg = tan })

hi("@field.lua",            { fg = fg })
hi("@type.qualifier",       { fg = cobalt })
hi("@storageclass.cpp",     { fg = cobalt })

-- ─── UI chrome ───────────────────────────────────────────────────────────────
hi("StatusLine",   { fg = fg,     bg = bg1 })
hi("StatusLineNC", { fg = fgdim,  bg = bg0 })
hi("WinSeparator", { fg = bg2,    bg = bg0 })
hi("Pmenu",        { fg = fg,     bg = bg1 })
hi("PmenuSel",     { fg = bg0,    bg = cobalt })
hi("PmenuSbar",    { bg = bg1 })
hi("PmenuThumb",   { bg = bg2 })
hi("Search",       { fg = bg0,    bg = sail })
hi("IncSearch",    { fg = bg0,    bg = warm,  bold = true })
hi("MatchParen",   { fg = sail,   bold = true, underline = true })
hi("SignColumn",   { bg = bg0 })
hi("ColorColumn",  { bg = bg1 })

-- ─── Filetype detection ───────────────────────────────────────────────────────
vim.filetype.add({
    extension = {
        cpp = "cpp", cc  = "cpp", cxx = "cpp",
        hpp = "cpp", hxx = "cpp",
        py  = "python",
        lua = "lua",
    },
})
