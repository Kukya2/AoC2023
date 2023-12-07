# carrera = File.readlines('test.txt').map(&:strip).map{|c| c.split(':')[1].split.join}.map(&:to_i)
carrera = File.readlines('input.txt').map(&:strip).map{|c| c.split(':')[1].split.join}.map(&:to_i)

def solveFormula(carrera)
    tmax, dist = carrera

    det = tmax.pow(2) - 4*dist
    # pp Math.sqrt(det)
    t1 = ((tmax - Math.sqrt(det))/2).ceil
    t2 = ((tmax + Math.sqrt(det))/2).floor
    
    d1 = t1*(tmax-t1)
    d2 = t2*(tmax-t2)
    # pp [d1, d2]

    t1 += 1 if d1 == dist
    t2 -= 1 if d2 == dist

    # return [t1,t2]
    return (t1..t2).count
end

p solveFormula(carrera)
