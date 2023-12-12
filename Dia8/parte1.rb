# file = File.readlines("./Dia8/test.txt").map(&:strip)
file = File.readlines("./Dia8/input.txt").map(&:strip)
$instruction = file.first
net = file[2..-1].map{|c| c.split(Regexp.union(["=","(",")",","," "])).reject(&:empty?).map(&:to_sym)}

$tree = {}
net.each do |nodo|
    key = nodo.shift  
    $tree[key] = nodo
end
# puts tree

count = 0
nextNode = :AAA#tree.keys.first
endOfTree = false

while not endOfTree
    $instruction.each_char do |inst|
        p "#{nextNode} ==>#{tree[nextNode]}, intruction: #{inst}"
        if inst == "R"
            nextNode = $tree[nextNode].last
        else
            nextNode = $tree[nextNode].first
        end
        count += 1
        endOfTree = nextNode == :ZZZ
        break if endOfTree
    end
end
# pp lastNode, count, endOfTree

pp count