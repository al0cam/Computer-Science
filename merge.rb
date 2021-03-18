# frozen_string_literal: true

def merge(array1, array2)
  help = []
  loop do
    break if array1.empty? || array2.empty?

    if array1[0] >= array2[0]
      help.insert(-1, array2.shift)
    else
      help.insert(-1, array1.shift)
    end
  end
  loop do
    break if array1.empty?

    help.insert(-1, array1.shift)
  end

  loop do
    break if array2.empty?

    help.insert(-1, array2.shift)
  end
  # puts "Help: #{help}"
  help
end

def merge_sort(array)
  # array = Array.new(array_arg)
  return array if array.length == 1

  # puts "Array: #{array}"
  left_part = array.take(array.length / 2)
  right_part = array.drop((array.length / 2))
  # puts "left part: #{left_part}"
  # puts "right part: #{right_part}"
  left_part = merge_sort(left_part)
  right_part = merge_sort(right_part)
  merge(left_part, right_part)
end

p merge_sort([1, 2, 3, 9, 8, 7, 6, 21, 23, 2, 1, 4])
