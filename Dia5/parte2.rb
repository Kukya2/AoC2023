# file = File.readlines("./Dia5/test.txt").map(&:strip)
file = File.readlines("./Dia5/input.txt").map(&:strip)

seeds = file.slice!(0,2)[0].split(":")[1].split().map(&:to_i)

# newSeeds =[]
# seeds.each_slice(2) do |pair|
#     a,b = pair
#     newSeeds.push(Array(a...a+b))
# end 
# p newSeeds.flatten!

maps = file.chunk { |element| element != "" }.select(&:first) \
    .map(&:last).map{|a| a.slice(1..-1).map(&:split).map{|p| p.map(&:to_i)}}

# pp maps

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
minSeed = Float::INFINITY
t1 = Time.now
seeds.each_slice(2).with_index do |pair,idx|
    a,b = pair
    i = 0
    while i < b
        x = a + i
        maps.each do |mapas|
            x = inOut(x, mapas)
        end
        minSeed = x if x < minSeed
        i += 1
        p Time.now - t1
        t1 = Time.new
    end
end 

p minSeed