---@enum os_types
local os_types = {
  UNKNOWN = 0,
  WINDOWS = 1,
  MACOS = 2,
  WSL = 3,
  LINUX = 4,
}

---@type table<string, os_types>
local sysname_to_os_type = {
  Darwin = os_types.MACOS,
  Windows_NT = os_types.WINDOWS,
  Linux = os_types.LINUX,
}

--- @return os_types
local function os()
  local uname = vim.loop.os_uname()
  local type = sysname_to_os_type[uname.sysname]
  if not type then
    return os_types.UNKNOWN
  end
  if type == os_types.LINUX and uname.release:find("microsoft") then
    return os_types.WSL
  end
  return type
end

---@class OSUtil
local M = {
  os = os(),
  types = os_types,
}

return M
