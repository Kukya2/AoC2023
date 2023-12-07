# file = File.readlines('test.txt').map(&:strip)
file = File.readlines('input.txt').map(&:strip)
total = 0
file.each do |line|
    wins, mine = line.split(":").last.split(" | ").map(&:split)
    total += 2.pow(wins.intersection(mine).count - 1) if wins.intersect?(mine) 
end
puts total.to_i