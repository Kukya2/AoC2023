# file = File.readlines("./Dia5/test.txt").map(&:strip)
file = File.readlines("./Dia5/input.txt").map(&:strip)

seeds = file.slice!(0,2)[0].split(":")[1].split().map(&:to_i)

maps = file.chunk { |element| element != "" }.select(&:first) \
    .map(&:last).map{|a| a.slice(1..-1).map(&:split).map{|p| p.map(&:to_i)}}

pp maps

def inOut(seed, maps)
    maps.each do |trio|
        dest, origin, ratio = trio
        if seed >= origin and seed < origin + ratio
            return seed + (dest-origin)
        end
    end
    return seed
end

# seeds.each{|s| p inOut(s,maps[0])}

maps.each do |mapas|
    seeds.map!{|s| inOut(s, mapas)}
end
p seeds.min