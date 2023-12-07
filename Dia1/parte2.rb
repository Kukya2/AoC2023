#Parse entrada de texto
# file = File.readlines('test.txt')
file = File.readlines('input.txt')

digits = '1'..'9'
digitsEscrito = ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine']

def searchIndex(str, substr)
    i = -1
    indices = []
    while !(a = str.index(substr, i + 1)).nil?
        indices.append a
        i = a
    end
    return indices
end

def remplazo(str)
    # original = str
    temp = str.dup
    ['one', 'two', 'three', 'four', 'five', 'six', 'seven', 'eight', 'nine'].each_with_index do |num, i|
        searchIndex(str, num).each do |indexnum|
          temp[indexnum] = (i + 1).to_s
        end
    end
    return temp
end

# puts searchIndex("sasdfsaddsdfddsad","d")
original_string = "oneoneone"
new_string = "oneoneone"

####
def leftDigit(str,digits)
    str.each_char do |char|
      if digits.include?(char)
        return char.to_i()
        end
    end
end

#Buscar digito por la derecha
def rightDigit(str, digits)
    str.reverse.each_char do |char|
        if digits.include?(char)
          return char.to_i()
        end
    end 
end

def numero(str,digits)
  leftDigit(str,digits) * 10 + rightDigit(str,digits)
end

total = 0
file.each do |line|
    # puts line, numero(line,digits)
  total += numero(remplazo(line),digits)
end

puts total