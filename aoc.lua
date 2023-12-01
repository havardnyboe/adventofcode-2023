-- http://lua-users.org/wiki/FileInputOutput

-- Read an entire file.
-- Use "a" in Lua 5.3; "*a" in Lua 5.1 and 5.2

aoc = {}

-- Read an entire file.
-- Use "a" in Lua 5.3; "*a" in Lua 5.1 and 5.2
function aoc:readall(filename)
    local fh = assert(io.open(filename, "rb"))
    local contents = assert(fh:read(_VERSION <= "Lua 5.2" and "*a" or "a"))
    fh:close()
    return contents
end

-- Write a string to a file.
function aoc:write(filename, contents)
    local fh = assert(io.open(filename, "wb"))
    fh:write(contents)
    fh:flush()
    fh:close()
end

-- Read, process file contents, write.
function aoc:modify(filename, modify_func)
    local contents = aoc:readall(filename)
    contents = modify_func(contents)
    aoc:write(filename, contents)
end

-- Spilt a string on "sep", or any whitespace (https://stackoverflow.com/a/7615129)
function aoc:split(inputstr, sep)
    if sep == nil then
        sep = "%s"
    end
    local t = {}
    for str in string.gmatch(inputstr, "([^" .. sep .. "]+)") do
        table.insert(t, str)
    end
    return t
end
