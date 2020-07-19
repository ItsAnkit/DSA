require 'pry'

def sudoku_valid?(array)
  matrix_by_column = array.each_slice(9).to_a
  matrix_by_row = matrix_by_column.transpose
  matrix_by_blocks = []
  # each row into blocks of 3 subarray [[1,2,3], [4,5,6], [7,8,9]]
  matrix_by_column_blocks = matrix_by_column.map { |subarray| subarray.each_slice(3).to_a }
  column = 0
  row = 0
  # add blocks of 3x3 matrix in matrix_by_blocks
  while row < 9 do
    # for each row, we have blocks of 3subarray, so for first 3 rows take first block and we will have a submatrix
   matrix_by_blocks << matrix_by_column_blocks[row][column] + matrix_by_column_blocks[row + 1][column] + matrix_by_column_blocks[row + 2][column]
    matrix_by_blocks << matrix_by_column_blocks[row][column + 1] + matrix_by_column_blocks[row + 1][column + 1] + matrix_by_column_blocks[row + 2][column + 1]
    matrix_by_blocks << matrix_by_column_blocks[row][column + 2] + matrix_by_column_blocks[row + 1][column + 2] + matrix_by_column_blocks[row + 2][column + 2]
    row += 3
  end
  (valid_matrix?(matrix_by_column) || valid_matrix?(matrix_by_row) || valid_matrix?(matrix_by_column_blocks)) ? 1 : 0
end

def valid_matrix?(matrix)
  required_block = (1..9).to_a
  matrix.each do |block|
    block_without_zero = block.reject { |element| element.eql?(0) }
    return false if !(block_without_zero - required_block).empty? || !block_without_zero.count.eql?(block_without_zero.uniq.count)
  end
  true
end

# valid_input = '3 0 6 5 0 8 4 0 0 5 2 0 0 0 0 0 0 0 0 8 7 0 0 0 0 3 1 0 0 3 0 1 0 0 8 0 9 0 0 8 6 3 0 0 5 0 5 0 0 9 0 6 0 0 1 3 0 0 0 0 2 5 0 0 0 0 0 0 0 0 7 4 0 0 5 2 0 6 3 0 0'
invalid_input = '3 6 7 5 3 5 6 2 9 1 2 7 0 9 3 6 0 6 2 6 1 8 7 9 2 0 2 3 7 5 9 2 2 8 9 7 3 6 1 2 9 3 1 9 4 7 8 4 5 0 3 6 1 0 6 3 2 0 6 1 5 5 4 7 6 5 6 9 3 7 4 5 2 5 4 7 4 4 3 0 7'
array = invalid_input.split(' ').map(&:to_i)
p sudoku_valid?(array)


# [ [[1 2 3], [4 5 6], [7 8 9]], [[1 2 3], [4 5 6], [7 8 9]] ]
