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

while true do
    kernel.write "> "
    local line = kernel.read()
    local fn, err = load(line, "REPL", "t", _G)
    if fn then
        local ok, err = pcall(fn)
        if ok then
            if err ~= nil then kernel.log.info(tostring(err)) end

        else
            kernel.log.error(err)
        end
    else kernel.log.error(assert(err)) end
end
