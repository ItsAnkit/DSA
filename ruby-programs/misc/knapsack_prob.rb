class KnapsackProb
  def call
    val = [60, 100, 120]
    weight = [10, 20, 30]
    capacity = 50
    n = val.length
    print knapsack(capacity, n, weight, val)
  end

  def knapsack(cap, n, weight, val)
    counter = 0
    k = Array.new(n + 1) { Array.new(cap + 1) }
    (0..n).each do |i|
      while (counter <= cap) do
        if (i==0 || counter==0) 
          k[i][counter] = 0;
        elsif weight[i-1] <= counter
          k[i][counter] = [ val[i-1] + K[i-1][counter - weight[i-1]],  K[i-1][counter] ].max
        else
          k[i][counter] = k[i - 1][counter]
        end
      end
      counter += 1
    end
    k[n][cap]
  end

end


KnapsackProb.new.call