file = File.new("./Dia15/test.txt").readline.split ","


def getHash(str)
    count = 0
    str.each_char do |chr|
        # p chr
        count += chr.ord
        count *= 17
        count = count % 256
        # p count
    end
    return count
end

pp getHash("HASH")