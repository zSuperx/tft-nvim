" Title:        True False Toggle 
" Description:  A plugin to toggle instances of true/false under the cursor.
" Last Change:  08/26/2025
" Maintainer:   zSuper <https://github.com/zSuperx>

" I got no clue how this file works btw, take that with a grain of salt.

" Prevents the plugin from being loaded multiple times. If the loaded
" variable exists, do nothing more. Otherwise, assign the loaded
" variable and continue running this instance of the plugin.
if exists("g:loaded_tft")
    finish
endif
let g:loaded_tft = 1

" Defines a package path for Lua. This facilitates importing the
" Lua modules from the plugin's dependency directory.
let s:lua_rocks_deps_loc =  expand("<sfile>:h:r") . "/../lua/tft-nvim/deps"
exe "lua package.path = package.path .. ';" . s:lua_rocks_deps_loc . "/lua-?/init.lua'"

" Exposes the plugin's functions for use as commands in Neovim.
command! -nargs=0 ToggleTF lua require("tft-nvim").toggle()
