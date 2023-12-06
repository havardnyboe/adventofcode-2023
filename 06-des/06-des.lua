require "aoc"

input = aoc:split(aoc:readall("input"), "\n")

p1_races = {}
time = aoc:split(input[1], " ")
distance = aoc:split(input[2], " ")

for i = 2, #time do
    p1_races[i - 1] = { time = tonumber(time[i]), distance = tonumber(distance[i]) }
end

p2_race = {}

for i, value in pairs(input) do
    line = aoc:split((value:gsub("%s", "")), ":")
    unit, value = line[1], line[2]
    p2_race[unit:lower()] = tonumber(value)
end

function get_possible_travels(time, distance)
    local travels = 0
    for s = 1, time - 1 do
        local d = s * (time - s)
        if d > distance and d > 0 then
            travels = travels + 1
        end
    end
    return travels
end

p1 = 1
p2 = 0
for i, race in pairs(p1_races) do
    p1 = p1 * get_possible_travels(race.time, race.distance)
end
p2 = get_possible_travels(p2_race.time, p2_race.distance)

print("Part 1: " .. p1)
print("Part 2: " .. p2)
