file = File.readlines('test.txt').map(&:strip).map{|c| c.split(':')[1].split}

def 