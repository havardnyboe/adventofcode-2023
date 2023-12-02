require "aoc"

-- input = aoc:split([[Game 1: 3 blue, 4 red; 1 red, 2 green, 6 blue; 2 green
-- Game 2: 1 blue, 2 green; 3 green, 4 blue, 1 red; 1 green, 1 blue
-- Game 3: 8 green, 6 blue, 20 red; 5 blue, 4 red, 13 green; 5 green, 1 red
-- Game 4: 1 green, 3 red, 6 blue; 3 green, 6 red; 3 green, 15 blue, 14 red
-- Game 5: 6 red, 1 blue, 3 green; 2 blue, 1 red, 2 green]], "\n")
input = aoc:split(aoc:readall("input"), "\n")

-- Parse the input data
games = {}
for _, line in pairs(input) do
    local game = { id = tonumber(line:match("Game (%d+):")), draws = {} }
    table.insert(games, game)
    for draw in line:gmatch("([^;]+)") do
        local counts = { red = 0, green = 0, blue = 0 }
        for count, color in draw:gmatch("(%d+) (%a+)") do
            counts[color] = tonumber(count)
        end
        table.insert(game.draws, counts)
    end
end

-- Check each game to see if it could have been played with the given cube counts
possible_games = {}
for _, game in pairs(games) do
    local possible = true
    for _, draw in pairs(game.draws) do
        if draw.red > 12 or draw.green > 13 or draw.blue > 14 then
            possible = false
            break
        end
    end
    if possible then
        table.insert(possible_games, game.id)
    end
end

-- Sum the IDs of the possible games
possible_games_sum = 0
for _, id in pairs(possible_games) do
    possible_games_sum = possible_games_sum + id
end

print("Part 1: " .. possible_games_sum)

min_sets = {}
for _, game in pairs(games) do
    local min_set = { red = 0, green = 0, blue = 0 }
    for _, draw in pairs(game.draws) do
        min_set.red = math.max(min_set.red, draw.red)
        min_set.green = math.max(min_set.green, draw.green)
        min_set.blue = math.max(min_set.blue, draw.blue)
    end
    table.insert(min_sets, min_set)
end

-- Calculate the power of the minimum set of cubes for each game
powers = {}
for _, min_set in pairs(min_sets) do
    local power = min_set.red * min_set.green * min_set.blue
    table.insert(powers, power)
end

-- Sum the powers of the minimum sets of cubes
powers_sum = 0
for _, power in pairs(powers) do
    powers_sum = powers_sum + power
end

print("Part 2: " .. powers_sum)
