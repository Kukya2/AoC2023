#Parse entrada de texto
# file = File.readlines('test.txt')
file = File.readlines('input.txt')

#Datos de la cosa
max = {
    "red" => 12,
    "green" => 13,
    "blue" => 14
}

total = 0

file.each do |line|
    game, sets = line.split ":"
    id = game.split[1].to_i
    # puts id
    delimiters = [';', ","]
    fact = true
    sets.split(Regexp.union(delimiters)).each do |color|
        num, col =  color.split
        if max[col] < num.to_i
            fact = false
        end
    end
    if fact
        total += id
    end
end
puts total

# delimiters = [':', ';', ","]
# puts file[0].split(Regexp.union(delimiters))[1]
