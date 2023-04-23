-- Copyright (C) 2023 Amrit Bhogal
--
-- This file is part of LuaOS.
--
-- LuaOS is free software: you can redistribute it and/or modify
-- it under the terms of the GNU General Public License as published by
-- the Free Software Foundation, either version 3 of the License, or
-- (at your option) any later version.
--
-- LuaOS is distributed in the hope that it will be useful,
-- but WITHOUT ANY WARRANTY; without even the implied warranty of
-- MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
-- GNU General Public License for more details.
--
-- You should have received a copy of the GNU General Public License
-- along with LuaOS.  If not, see <http://www.gnu.org/licenses/>.

---@class Kernel
---@field log { debug: fun(msg: string), info: fun(msg: string), warning: fun(msg: string), error: fun(msg: string), fatal: fun(msg: string) }
---@field write fun(msg: string)
---@field read fun(): string
kernel = kernel

kernel.log.info "REPL"

---@generic T
---@param v T?
---@param message string
---@vararg any
---@return T
function assert(v, message, ...)
    if not v then kernel.log.error(message:format(...)) end

    return v
end

while true do
    kernel.write "> "
    local line = kernel.read()
    if line:sub(1, 1) == '=' then
        line = "return "..line:sub(2)
    end

    local fn = assert(loadstring(line, "REPL"))

    local ok, result = pcall(fn)
    if ok then
        kernel.write(tostring(result)..'\n')
    else
        kernel.log.error(result)
    end
end
