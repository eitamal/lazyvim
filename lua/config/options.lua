-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.clipboard = {
  name = "WslClipboard",
  copy = {
    ["+"] = "clip.exe",
    ["*"] = "clip.exe",
  },
  paste = {
    ["+"] = 'pwsh.exe -NoLogo -NoProfile -NonInteractive -Command [Console]::Out.Write($(Get-Clipboard -Raw).ToString().Replace("`r", ""))',
    ["*"] = 'pwsh.exe -NoLogo -NoProfile -NonInteractive -Command [Console]::Out.Write($(Get-Clipboard -Raw).Tostring().Replace("`r", ""))',
  },
  cache_enabled = 0,
}
