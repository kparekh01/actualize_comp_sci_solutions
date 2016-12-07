def selection_sort(array)
  count = 0
  swap = 0
  (array.length - 1).times do |i|
    index_of_lowest_number = i
    (i + 1).upto(array.length - 1) do |j|
      index_of_lowest_number = j if array[j] < array[index_of_lowest_number]
      count += 1
      #This loop compares element array[j] to all other elements of the array
    end
    array[i], array[index_of_lowest_number] = array[index_of_lowest_number], array[i] if index_of_lowest_number != i
    swap += 1
    #This loop makes the index swap if an element was found to have a lower value than array[index_of_lowest_number]
    #here is what the array looks like after each rotation, pay attention to the numbers:
    # [50, 60, 70, 20, 30, 10] --> original array
    # [10, 60, 70, 20, 30, 50] --> after loop # 1
    # [10, 20, 70, 60, 30, 50] --> after loop # 2
    # [10, 20, 30, 60, 70, 50] --> after loop # 3
    # [10, 20, 30, 50, 70, 60] --> after loop # 4
    # [10, 20, 30, 50, 60, 70] --> after loop # 5(final result)
  end
  return ["Here is your sorted array using selection sort: #{array}",
          "The selection sort process took #{count.to_s} comparisons and #{swap.to_s} swaps for a total of #{(swap + count).to_s} steps."
          ]
end

puts selection_sort([50, 60, 70, 20, 30, 10])
#Here is your sorted array using selection sort: [10, 20, 30, 50, 60, 70]
#The selection sort process took 15 comparisons and 5 swaps for a total of 20 steps.
