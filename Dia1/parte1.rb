#Parse entrada de texto
# file = File.readlines('test.txt')
file = File.readlines('input.txt')

# ex = file[3]
# puts ex

#Buscar digito por la izquierda
digits = '1'..'9'
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
  total += numero(line,digits)
end

puts total