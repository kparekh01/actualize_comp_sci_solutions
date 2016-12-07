
def bubble_sort(a, swap_sum = 0)
  comp_sum = (a.length - 1).downto(1).map{|num| num}.inject(:+)
  something_changed = false
  a[0...-1].each_with_index do |num, i|
    if a[i] > a[i + 1]
      a[i], a[i + 1] = a[i + 1], a[i]
      something_changed = true
      swap_sum += 1 #keeps count of total number of swaps through each passthrough
    end
  end
  if something_changed
    bubble_sort(a, swap_sum) # now swap_sum equals the value of how many swaps were made on the first passthrough
  else
  ["Your sorted array using bubble sort: #{a}",
   "Array had a total of #{comp_sum} comparisons.",
   "Array had a total of #{swap_sum} swaps.",
   "Total number of steps to sort array: #{comp_sum + swap_sum}"
  ]
  end
end
arr = [50, 60, 70, 20, 30, 10]
puts bubble_sort(arr)
# Your sorted array using bubble sort: [10, 20, 30, 50, 60, 70]
# Array had a total of 15 comparisons.
# Array had a total of 11 swaps.
# Total number of steps to sort array: 26
