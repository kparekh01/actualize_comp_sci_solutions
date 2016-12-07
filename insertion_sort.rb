def insertion_sort(arr)
  size = 2
  while (size - 1) < arr.length
    element = arr[size-1] # 2(arr[1])/ 7(arr[2])
      index = size - 2 # 0(index) / 1(index)
      while(index >= 0) && (element < arr[index]) # (0 >= 0) && (2 < 4) / (1 >= 0) && (7 < 4)
            arr[index + 1] = arr[index] # 2 = 4
            index -= 1
      end
  arr[index + 1] = element #4(arr[1]) = element / 7(arr[2]) = element
  size += 1
  end
  arr
end

arr = [4,2,7,1,3]
#arr = [2,4,7,1,3]
p insertion_sort(arr)

#take some more notes and display the steps involved in the process of insertion_sort
