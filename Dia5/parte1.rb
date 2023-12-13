file = File.readlines("./Dia5/test.txt").map(&:strip)

seeds = file.slice!(0,2)[0].split(":")[1].split().map(&:to_i)
maps = file

pp seeds
pp maps