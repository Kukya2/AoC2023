# file = File.new("./Dia15/test.txt").readline.split ","
file = File.new("./Dia15/input.txt").readline.split ","


def getHash(str)
    count = 0
    str.each_char do |chr|
        count += chr.ord
        count *= 17
        count %=  256
    end
    return count
end

total = 0
file.each do |str|
    total += getHash(str)
end

pp total