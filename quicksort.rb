class SortableArray
  attr_reader :array

  def initialize(array)
    @array = array
  end

  def length
    @array.length
  end

  def partition(left_pointer, right_pointer)

    pivot_position = right_pointer
    pivot = @array[pivot_position] #always choose the rightmost element as the pivot

    right_pointer -= 1 #start the right pointer immediately to the left of the pivot

    while true do #start main partition loop

      while @array[left_pointer] < pivot do #while @array[left_pointer] value is less than the pivot value increase left pointer by 1
        left_pointer += 1
      end

      while @array[right_pointer] > pivot do #while @array[right_pointer] value is greater than the pivot value decrease right pointer by 1
        right_pointer -= 1
      end

      if left_pointer >= right_pointer # if at any point the left counter is >= right pointer, then break main partition loop
        break
      else
        swap(left_pointer, right_pointer) #otherwise swap the values where the indexes currently are.
      end
    end
    swap(left_pointer, pivot_position) # If main loop is broken as a final step, we swap the left pointer with the pivot itself
                                       # ensuring a successful partition.
    left_pointer # return the left pointer so it can be used in the quicksort method which calls this partition method recursively.
  end

  def swap(pointer_1, pointer_2)
    left_point_value = @array[pointer_1]
    right_point_value = @array[pointer_2]
    @array[pointer_1] = right_point_value
    @array[pointer_2] = left_point_value
  end

  def quicksort(left_index, right_index)

    if right_index - left_index <= 0 #base case: the subarray has 0 or 1 elements return the entire array.
      return @array
    end

    pivot_position =  partition(left_index, right_index)# Partition the array and grab the position of the pivot

    quicksort(left_index, pivot_position - 1) # Recursively call this quicksort method on whatever is to the left of the pivot

    quicksort(pivot_position + 1, right_index) # Recursively call this quicksort method on whatever is to the right of the pivot:
  end

end

arr = SortableArray.new([0,5,2,1,6,3])
p arr.partition(0, arr.length - 1) #returns 3 the index position of current pivot [0, 1, 2, 3, 6, 5] <-- this is what array looks like after 1st partition
p arr.quicksort(0, arr.length - 1) #returns the final array after recursive partitioning, final array after recursive partitioning [0, 1, 2, 3, 5, 6]
