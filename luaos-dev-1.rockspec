package = "LuaOS"
version = "dev-1"
source = {
   url = "git+https://github.com/TheLuaOSProject/Userland.git"
}
description = {
   homepage = "https://github.com/TheLuaOSProject/Userland",
   license = "GPLv3"
}
build = {
   type = "builtin",
   modules = {
      ["repl"] = "src/repl.lua",
      -- ["module.nested"] = "src/module/nested.lua",
      -- ["animation"] = "src/animation.lua"
   }
}
