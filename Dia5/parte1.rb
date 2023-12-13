file = File.readlines("./Dia5/test.txt").map(&:strip)

seeds = file.slice!(0,2)[0].split(":")[1].split().map(&:to_i)
maps = file.chunk { |element| element != "" }.select(&:first) \
    .map(&:last).map{|a|a.slice(1..-1).map(&:split).map{|p| p.map(&:to_i)}}

def inOut(seed, maps)
    ranges = maps.map{|m| {m[1]..m[1]+m[2]-1 => m[0]...m[0]+m[2]-1 }}
    p ranges
    ranges.each do |pair|
        rang = pair.keys.first
        if rang.include? seed
           i = rang.to_a.index seed
           return pair.values.first.to_a[i]
        end
    end
end

pp seeds
pp inOut(seeds[0],maps[0])