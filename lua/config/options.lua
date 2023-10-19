-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

-- Set wsl-clipboard for vim clipboard if running WSL
-- Check if the current linux kernal is microsoft WSL version
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
    version_file:close()
    return true
  end
  return false
end

-- If current linux is under WSL then use wclip.exe
-- More info: https://github.com/memoryInject/wsl-clipboard
if is_wsl() then
  vim.g.clipboard = {
    name = "wsl-clipboard",
    copy = {
      ["+"] = "wcopy",
      ["*"] = "wcopy",
    },
    paste = {
      ["+"] = "wpaste",
      ["*"] = "wpaste",
    },
    cache_enabled = true,
  }
end
