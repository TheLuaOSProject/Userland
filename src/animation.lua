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

---@class Kernel.Framebuffer
---@field get fun(): Kernel.Framebuffer
---@field fill fun(self: Kernel.Framebuffer, color: integer)
---@field set_pixel fun(self: Kernel.Framebuffer, x: integer, y: integer, color: integer)
---@field get_pixel fun(self: Kernel.Framebuffer, x: integer, y: integer): integer
---@field draw_line fun(self: Kernel.Framebuffer, x1: integer, y1: integer, x2: integer, y2: integer, color: integer)
---@field draw_rect fun(self: Kernel.Framebuffer, x: integer, y: integer, width: integer, height: integer, color: integer)
---@field draw_circle fun(self: Kernel.Framebuffer, x: integer, y: integer, radius: integer, color: integer)
---@field draw_triangle fun(self: Kernel.Framebuffer, x1: integer, y1: integer, x2: integer, y2: integer, x3: integer, y3: integer, color: integer)
---@field draw_text fun(self: Kernel.Framebuffer, x: integer, y: integer, text: string, size: integer, color: integer)
---@field dimensions fun(self: Kernel.Framebuffer): integer, integer
---@field save fun(self: Kernel.Framebuffer)
---@field load fun(self: Kernel.Framebuffer)
kernel.framebuffer = kernel.framebuffer

--0xAARRGGBB
local colours = {
    black       = 0xFF000000,
    white       = 0xFFFFFFFF,
    red         = 0xFFFF0000,
    green       = 0xFF00FF00,
    blue        = 0xFF0000FF,
    yellow      = 0xFFFFFF00,
    cyan        = 0xFF00FFFF,
    magenta     = 0xFFFF00FF,
    orange      = 0xFFFFA500,
    purple      = 0xFF800080,
    brown       = 0xFFA52A2A,
    pink        = 0xFFFFC0CB,
    grey        = 0xFF808080,
    light_grey  = 0xFFD3D3D3,
    dark_grey   = 0xFFA9A9A9,
    lime        = 0xFF00FF00,
    maroon      = 0xFF800000,
    navy        = 0xFF000080,
    olive       = 0xFF808000,
    teal        = 0xFF008080,
    transparent = 0x00000000
}

local fb = kernel.framebuffer.get()

local width, height = fb:dimensions()

---@param ticks integer
---@return integer
local function sleep(ticks)
    local i = 0
    while i < ticks do
        i = i + 1
    end

    return i
end

for i = 0, width, 10 do
    fb:draw_rect(i, height/2 - 10, 10, 10, colours.red)

    -- kernel.log.debug(string.format("Drawing rect at (%d, %d)", i, height/2))
    sleep(100000)
end

