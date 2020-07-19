class Lcs
  def call(str1, str2)
    str1_len = str1.length
    str2_len = str2.length
    dp_arr = Array.new(str1_len + 1) { Array.new(str2_len + 1) }
    @lcs = []
    i = 0
    while i <= str1_len do
      j = 0
      while j <= str2_len do
        if i.eql?(0) || j.eql?(0)
          dp_arr[i][j] = 0
        elsif str1[i - 1].eql?(str2[j - 1])
          @lcs << str2[j - 1]
          dp_arr[i][j] = dp_arr[i - 1][j -1] + 1
        else
          dp_arr[i][j] = [ dp_arr[i - 1][j], dp_arr[i][j - 1] ].max
        end
        j += 1
      end
      i += 1
    end
    dp_arr[str1_len][str2_len]
  end

  def shortest_common_supersequence(str1, str2)
    @lcs = @lcs.uniq.join('')
    print "\n"
    @lcs.each_char do |char|
      str1.sub!(char, '')
      str2.sub!(char, '')
    end
    str1 + @lcs + str2
  end
end

str1 = "AGGTAB"
str2 = "GXTXAYB"
lcs = Lcs.new
print lcs.call(str1, str2)
print lcs.shortest_common_supersequence(str1, str2)



#   def my_version(str1, str2)
#     str1_len = str1.length
#     str2_len = str2.length
#     dp_arr = Array.new(str1_len) { Array.new(str2_len) }     
#     subsequence = []
#     i = 0
#     while i < str1_len do
#       j = 0 
#       while j < str2_len do
#         if str1[i].eql?(str2[j])
#           subsequence << str1[i]
#         end
#         j += 1 
#       end
#       i += 1
#     end
#     subsequence
#   end
# end

# str1 = "AGGTAB"
# str2 = "GXTXAYB"
# Lcs.new.call(str1, str2)
