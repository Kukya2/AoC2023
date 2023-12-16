# file = File.new("./Dia15/test.txt").readline.split ","
file = File.new("./Dia15/input.txt").readline.split ","

def getHash(str)
    count = 0
    str.each_char do |chr|
        count += chr.ord
        count *= 17
        count %=  256
    end
    return count
end

boxes = Array.new(256){[]}

file.each do |str|
    if str.include? "-"
        name, _ = str.split "-" 
        boxId = getHash(name)
        i = boxes[boxId].index{|el| el[0] == name}
        if not i.nil?
            boxes[boxId].delete_at i
        end
    elsif str.include? "="
        name, lens = str.split "="
        boxId = getHash(name)
        i = boxes[boxId].index{|el| el[0] == name}
        if not i.nil?
            boxes[boxId][i] = [name, lens.to_i]
        else
            boxes[boxId].push [name, lens.to_i]
        end
    end
end

total = 0

boxes.each_with_index do |box, idx|
    box.each_with_index do |slot,idx2|
        total += slot[1]*(idx+1)*(idx2+1)
    end
end

pp boxes[0..4], total