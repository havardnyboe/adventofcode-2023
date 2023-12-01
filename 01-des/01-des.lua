require "aoc"

-- local input = aoc:split "1abc2\npqr3stu8vwx\na1b2c3d4e5f\ntreb7uchet"
-- local input = aoc:split "two1nine\neightwothree\nabcone2threexyz\nxtwone3four\n4nineeightseven2\nzoneight234\n7pqrstsixteen"
local input = aoc:split(aoc:readall("input"))

function find_calibration_values(list)
    local sum = 0
    local numbers = { "one", "two", "three", "four", "five", "six", "seven", "eight", "nine" }

    for i, value in pairs(list) do
        local nums = ""
        for j = 1, #value do
            local c = value:sub(j, j)
            if tonumber(c) then
                nums = nums .. c
            else
                for k, v in pairs(numbers) do
                    if value:sub(j, j + #v - 1) == v then
                        nums = nums .. k
                        break
                    end
                end
            end
        end
        sum = sum + tonumber(nums:sub(1, 1) .. nums:sub(#nums, #nums))
    end
    return sum
end

print(find_calibration_values(input))
