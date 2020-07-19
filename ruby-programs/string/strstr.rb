class Strstr
  def perform(str, subsequence)
     index = str.index(subsequence)
     return -1 unless index
     index
  end
end

puts Strstr.new.perform('GeeksForGeeks', 'For')
