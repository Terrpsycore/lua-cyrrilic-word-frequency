os.setlocale('Russian_Russia.1251')

local path = 'input.txt'
local input = io.open(path, 'r')
-- Deleting all numbers and punctuation marks except word-part hyphens
local text = input:read('*a'):gsub('[,.?!)(:"%d]', ' '):gsub('%s+-', ' '):gsub('-%s+', ' ')
local frequency = {}
local words = {}

input:close()

for word in text:gmatch('%S+') do
    word = word:lower()
    if frequency[word] then
        frequency[word] = frequency[word] + 1
    else
        frequency[word] = 1
        words[#words+1] = word
    end
end

table.sort(words, function(a, b) return frequency[a] > frequency[b] end)

local output = io.open('output.txt', 'w')

for i, word in pairs(words) do
    output:write(string.format('%u. %s (%u)\n', i, word, frequency[word]))
    if i == 100 then
        break
    end
end

output:close()
