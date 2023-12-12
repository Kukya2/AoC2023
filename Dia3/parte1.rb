# file = File.readlines('./Dia3/test.txt').map(&:strip)
file = File.readlines('./Dia3/input.txt').map(&:strip)

def findNumCoords(file, i, j)
    left, right = j,j
    #izquierda
    while (file[i][left-1].match?(/\d/)) and left > 0
        left -= 1
    end
    #derecha
    while (right < file[i].length-1 and file[i][right+1].match?(/\d/))
        right += 1
    end
    # p [i,j], left, right
    p file[i][left..right]
    return [i,left,right]
end

def adyacentes(file, i,j)
    pos = [-1, 0, 1].repeated_permutation(2).to_a.select{|a| a != [0,0]}
    pos.each do |pair|
        x,y = pair
        if (i + x) < 0 or (i + x) > file.length-1 or (j + y) < 0 or (j + y) > file[i].length-1
            next
        end
        #si es digito, encotrar coordenas de los digitos
        pp [file[i + x][j + y], i,j, pair]
        if file[i + x][j + y].match?(/\d/)
            # pp file[i + x][j + y], findNumCoords(file,i+x,j+y)
            $num_coords.append(findNumCoords(file,i+x,j+y))
        end
    end
end


$num_coords = []
# p file[0].length
file.each_with_index do |line,i|
    line.each_char.with_index do |c,j|
        # pp [i,j]
        if c.match?(/[\*\@\#\+\=\\\/\$\%\&\-\_]/)
            adyacentes(file,i,j)
        end 

    end
end

total = 0

$num_coords.uniq.each do |coord|
    i,left,right = coord
    total += file[i][left..right].to_i
end
puts total