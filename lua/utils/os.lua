---@class Config
local defaults = {
  os = 0,
}

local M = {}

--- @type Config
M.opts = {}

--- @param opts Config|nil
function M.setup(opts)
  M.opts = vim.tbl_deep_extend("force", {}, defaults, opts or {})
  M.opts.os = M.opts.os == 0 and M.os() or M.opts.os
end

M.os_type = {
  WINDOWS = 1,
  MACOS = 2,
  WINWSL = 3,
  LINUX = 4,
  UNKNOWN = 5,
}

--- @return integer
function M.os()
  local uname = vim.loop.os_uname()
  if uname.sysname == "Darwin" then
    return M.os_type.MACOS
  elseif uname.sysname == "Windows_NT" then
    return M.os_type.WINDOWS
  elseif uname.sysname == "Linux" then
    if uname.version:find("microsoft") then
      return M.os_type.WINWSL
    else
      return M.os_type.LINUX
    end
  end
  return M.os_type.UNKNOWN
end

end


return M
