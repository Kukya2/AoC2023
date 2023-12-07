# file = File.readlines('test.txt').map(&:strip)
file = File.readlines('input.txt').map(&:strip)
suma = 0
copias = Hash.new(0)
file.each.with_index(1) do |line,i|
    wins, mine = line.split(":").last.split(" | ").map(&:split)
    copias[i] += 1
    if wins.intersect? mine 
        matches = wins.intersection(mine).count
        range = i+1..matches+i 
        card = i
        pp i,range
        range.map{|i| copias[i]+= copias[card] }
    end
end
pp copias, copias.values.sum