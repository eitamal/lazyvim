local M = {}
M.os_type = {
  UNKNOWN = 0,
  WINDOWS = 1,
  MACOS = 2,
  WSL = 3,
  LINUX = 4,
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
