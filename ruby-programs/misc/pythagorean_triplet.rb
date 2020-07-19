class PythagoreanTriplet
  def call(limit)
    m = 2
    a, b, c = 0, 0, 0
    while c < limit do
      n = 1
      while n < m do
        a = m*m - n*n
        b = 2*m*n
        c = m*m + n*n
        break if c > limit
        print [a, b, c]
        n += 1
      end
      m += 1
    end
  end
end


PythagoreanTriplet.new.call(20)