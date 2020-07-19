def circular_tour(hash)
  hash.each do |petrol, distance|

  end
end

input = '4 6 6 5 7 3 4 5'
hash = {}
array = input.split(' ').map(&:to_i)
(0...(array.length)).step(2) do |index|
  petrol = array[index]
  distance = array[index + 1]
  hash[petrol] = distance
end
p circular_tour(hash)
