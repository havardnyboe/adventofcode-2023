# Advent of Code 2022

Nytt forsøk i år, nå med Lua.

Oppdater LUA_PATH og LUA_CPATH for å kunne importere `aoc.lua` modulen.

```sh
## final ;; ensure that default path will be appended by Lua
export LUA_PATH="../?.lua;;"
export LUA_CPATH="./?.so;/usr/local/lib/lua/5.3/?.so;
                /usr/local/share/lua/5.3/?.so;../?.lua"
```
