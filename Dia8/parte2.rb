# file = File.readlines("./Dia8/test.txt").map(&:strip)
file = File.readlines("./Dia8/input.txt").map(&:strip)
instruction = file.first
net = file[2..-1].map{|c| c.split(Regexp.union(["=","(",")",","," "])).reject(&:empty?)}

tree = Hash.new
net.each do |nodo|
    key = nodo.shift  
    tree[key] = nodo
end

bases =  tree.reject{|k,v| not k.end_with? "A"}.keys


def buscarPasos(base,instruction,tree)
    count = 0
    nextNode = base
    endOfTree = false

    while not endOfTree
        instruction.each_char do |inst|
            # p "#{nextNode} ==>#{tree[nextNode]}, intruction: #{inst}"
            if inst == "R"
                nextNode = tree[nextNode].last
            else
                nextNode = tree[nextNode].first
            end
            count += 1
            endOfTree = nextNode.end_with? "Z"
            break if endOfTree
        end
    end
    return count
end
# pp terminaA? $tree

finals = bases.map{|base| buscarPasos base, instruction, tree}

p finals.reduce(1,:lcm)
