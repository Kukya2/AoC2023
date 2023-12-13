file = File.readlines("./Dia5/test.txt").map(&:strip)

seeds = file.slice!(0,2)[0].split(":")[1].split().map(&:to_i)
maps = file.chunk { |element| element != "" }.select(&:first) \
    .map(&:last).map{|a|a.slice(1..-1).map(&:split).map{|p| p.map(&:to_i)}}

maps.map!{|el| el.map{|m| {m[1]..m[1]+m[2]-1 => m[0]..m[0]+m[2]-1 }}}

# p maps

def inOut(seed, maps)
    maps.each do |pair|
        rang = pair.keys.first
        if rang.include? seed
            i = rang.to_a.index seed
            # pp [seed, rang.size, i, pair.values.first.size]
            return pair.values.first.to_a[i]
        end
    end
    return seed
end

# seeds.each{|s| p inOut(s,maps[0])}

maps.each do |mapas|
    seeds.map!{|s| inOut(s, mapas)}
end
p seeds.min