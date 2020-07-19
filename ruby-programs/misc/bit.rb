class Bit
  def opposite_signs(x, y)
    # sign bit i.e., leftmost bit will be 1 for -ve numbers and 0 for +ve numbers.
    (x ^ y < 0)
  end

  def com(s, n)
    len = s.length
    i = 0
    total_count = 0
    (0...len).each do |i|
      (i...len).each do |j|
        if s[i..j].gsub('0', '').length.eql?(n)
          print "#{s[i..j]}   \n"
          total_count += 1
        end
      end
    end
    print total_count
  end
end

Bit.new.com('1010', 2)