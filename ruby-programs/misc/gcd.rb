class Gcd
  def call(a, b)
    return b if a.eql?(0)
    return a if b.eql?(0)
    return a if a.eql?(b)
    return call(a - b, b) if (a > b)   
    return call(a, b - a)
  end
end


Gcd.new.call(98, 16)