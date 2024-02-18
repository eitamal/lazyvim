-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

-- local utils = require("config.utils")

-- Check if the current linux kernal is microsoft WSL version
local function is_wsl()
  local version_file = io.open("/proc/version", "rb")
  if version_file ~= nil and string.find(version_file:read("*a"), "microsoft") then
    version_file:close()
    return true
  end
  return false
end

-- Disable providers that are not needed
vim.g.loaded_ruby_provider = 0
vim.g.loaded_perl_provider = 0

if is_wsl() then
  -- if utils.os() == utils.os_type.WINWSL then
  -- If under WSL, specify the rtx managed node and python binaries as host programs
  -- TODO: use a global variable for specifying a shim directory rather than relying on it being WSL
  -- TODO: vim.g.node_host_prog = "~/.local/share/rtx/shims/neovim-node-host"
  vim.g.python3_host_prog = "~/.pyenv/shims/python3"

  -- If current linux is under WSL then use wclip.exe
  -- More info: https://github.com/memoryInject/wsl-clipboard
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
