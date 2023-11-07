local highlights = require("utils.highlights")

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
      custom_highlights = highlights.get,
    },
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
