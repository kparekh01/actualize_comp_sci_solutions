def insertion_sort(arr)
  count = 0
  size = 2
  while (size - 1) < arr.length
    element = arr[size-1]
      index = size - 2
      while(index >= 0) && (element < arr[index])
            arr[index + 1] = arr[index]
            index -= 1
            count += 3
      end
  arr[index + 1] = element
  size += 1
  end
  puts "Your sorted array using insertion sort is: #{arr}, steps it took: #{count}"
end
insertion_sort([4,2,7,1,3])
