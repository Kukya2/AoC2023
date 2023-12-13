file = File.readlines("./Dia5/test.txt").map(&:strip)

seeds = file.slice!(0,2)[0].split(":")[1].split().map(&:to_i)
maps = file.chunk { |element| element != "" }.select(&:first) \
    .map(&:last).map{|a|a.slice(1..-1).map(&:split).map{|p| p.map(&:to_i)}}

pp seeds
pp maps