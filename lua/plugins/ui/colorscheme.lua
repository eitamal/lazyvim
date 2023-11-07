-- Credit for most of this goes to Myles Mo's awesome neovim config - https://github.com/emxxjnm/nvim
-- (defined in lua/mvim/plugins/colorscheme.lua)
local function custom_highlights(colors)
  return {
    -- lazy.nvim
    LazyH1 = {
      bg = colors.none,
      fg = colors.lavender,
      style = { "bold" },
    },
    LazyButton = {
      bg = colors.none,
      fg = colors.overlay0,
    },
    LazyButtonActive = {
      bg = colors.none,
      fg = colors.lavender,
      style = { "bold" },
    },
    LazySpecial = { fg = colors.sapphire },

    CmpItemMenu = { fg = colors.subtext1 },
    MiniIndentscopeSymbol = { fg = colors.overlay0 },

    FloatBorder = {
      fg = colors.overlay1,
      bg = colors.none,
    },

    FloatTitle = {
      fg = colors.lavender,
      bg = colors.none,
    },

    -- nvim-notify
    -- Set background since nvim-notify expects it and transparent background means it's not set (fg is already set by Catppuccin)
    NotifyBackground = { fg = colors.text, bg = colors.base },
    --- Error
    NotifyERRORBorder = { bg = colors.none },
    NotifyERRORIcon = { bg = colors.none },
    NotifyERRORTitle = { bg = colors.none },
    --- Warning
    NotifyWARNBorder = { bg = colors.none },
    NotifyWARNIcon = { bg = colors.none },
    NotifyWARNTitle = { bg = colors.none },
    --- Info
    NotifyINFOBorder = { bg = colors.none },
    NotifyINFOIcon = { bg = colors.none },
    NotifyINFOTitle = { bg = colors.none },
    --- Debug
    NotifyDEBUGBorder = { bg = colors.none },
    NotifyDEBUGIcon = { bg = colors.none },
    NotifyDEBUGTitle = { bg = colors.none },
    --- Trace
    NotifyTRACEBorder = { bg = colors.none },
    NotifyTRACEIcon = { bg = colors.none },
    NotifyTRACETitle = { bg = colors.none },
    --- Body???
  }
end

return {
  {
    "catppuccin/nvim",
    lazy = true,
    name = "catppuccin",
    opts = {
      flavour = "macchiato",
      background = {
        dark = "macchiato",
      },
      transparent_background = true,
      custom_highlights = custom_highlights,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
