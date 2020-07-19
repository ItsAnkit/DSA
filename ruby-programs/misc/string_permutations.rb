class StringPermutations
  def call(str, low, high)
    if low.eql?(high)
      print str
      print "\n"
    else
      (low..high).each do |index|
        swap(str, low, index)
        call(str, low + 1, high)
        swap(str, low, index)
      end
    end
  end

  def swap(str, x, y)
    str[x], str[y] = str[y], str[x]
  end
end

str = 'abc'
StringPermutations.new.call(str, 0, str.length - 1)
