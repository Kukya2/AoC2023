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
    max = {
    "red" => 0,
    "green" => 0,
    "blue" => 0
    }
    # fact = true
    
    sets.split(Regexp.union(delimiters)).each do |color|
        num, col =  color.split
        if max[col] < num.to_i
            max[col] = num.to_i
        end
    end
    # puts max
    total += max.values.inject(:*)
end
puts total

# delimiters = [':', ';', ","]
# puts file[0].split(Regexp.union(delimiters))[1]
