def merge(arr1, arr2)
  length = (arr1.length + arr2.length)
  arr3 = []
  i = 0
  while (i < length)
    if (arr1[0] != nil && arr2[0] != nil)
      arr1[0] < arr2[0]  ? arr3 << arr1.shift : arr3 << arr2.shift
    else
      arr1[0].nil? ? arr3 << arr2.shift : arr3 << arr1.shift
    i += 1
    end
  end
  arr3.compact
end

def halve_and_merge(array)
  return array if array.length == 1
  array_1 = array[0..(array.length / 2) - 1]
  array_2 = array[(array.length / 2)..-1]
  merge(halve_and_merge(array_1), halve_and_merge(array_2))
end

p halve_and_merge([4,2,3,1])
#3 merge([4], [2]) +
#6 merge([3], [1]) +
#13 merge([2,4], [1,3])<--- total # of steps
# [1, 2, 3, 4] <--- your sorted array

p halve_and_merge([1,3,6,2,4,5])
p halve_and_merge([4,2,6,7,9,3,1,8])
p halve_and_merge([4,2,3,1,5,59,65,23])
# [1, 2, 3, 4, 5, 6]
# [1, 2, 3, 4, 6, 7, 8, 9]
# [1, 2, 3, 4, 5, 23, 59, 65]


# quick explanation of how the computer uses a stack for recursive methods for halve_and_merge([4,2,3,1])

recursion_stack =[
  halve_and_merge([4,2,3,1]), #Last to run interperted as merge_sort([2,4], [1,3]) returning [1,2,3,4]
  halve_and_merge([4,2]),# currently in the middle of running merge_sort(halve_and_merge([4]), halve_and_merge([2]))
  halve_and_merge([4]), #executed in stack first because the base case is reached.(popped from stack after) --> merge_sort([4], halve_and_merge([2])
  halve_and_merge([2]), #executed in stack first because the base case is reached.(popped from stack after) --> merge_sort([4], ([2]) gets executed returning([2,4]) because
                        #merge_sort(([4],[2]), halve_and_merge(array_2)), will run the first argument because there is no method recursing.(halve_and_merge([4,2])) is now popped from the stack.
  halve_and_merge([3,1]),#currently in the middle of running merge_sort(halve_and_merge([3]), halve_and_merge([1]))
  halve_and_merge([3]),#executed in stack first because the base case is reached.(popped from stack after) --> merge_sort([3], halve_and_merge([1])
  halve_and_merge([1]) #executed in stack first because the base case is reached.(popped from stack after) --> merge_sort([3], ([1]) gets executed returning([1,3])because
                       #merge_sort([2,4], ([3],[1])), will run the method to completion. (halve_and_merge([3,1])) is now popped from the stack.
  ]

#fix method for counting comp's and pushes:
$arr = []
def merge(arr1, arr2, steps = 0)
  length = (arr1.length + arr2.length)
  arr3 = []
  i = 0
  while (i < length)
    if (arr1[0] != nil && arr2[0] != nil)
      if arr1[0] < arr2[0]
        steps += 1
        arr3 << arr1.shift
        steps += 1
      else
        arr3 << arr2.shift
        steps += 1
      end
    else
      if arr1[0].nil?
        arr3 << arr2.shift
        steps += 1
      else
        arr3 << arr1.shift
        steps +=  1
      end
    i += 1
    end
  end
  $arr << steps
  p $arr.inject(:+)
  arr3.compact
end

def halve_and_merge(array)
  return array if array.length == 1
  array_1 = array[0..(array.length / 2) - 1]
  array_2 = array[(array.length / 2)..-1]
  merge(halve_and_merge(array_1), halve_and_merge(array_2))
end

p halve_and_merge([4,2,3,1])
p"**********************************"
p halve_and_merge([4,2,6,7,9,3,1,8])
=begin

arr = [6, 1, 0, 9, 4, 7, 2, 8] --> merge_sort breakdown of this array below:

merge(halve_and_merge([6,1,0,9], halve_and_merge[4,7,2,8])

merge(halve_and_merge([6,1,0,9])
merge(halve_and_merge([6,1], halve_and_merge[0,9])
merge([6], [1]) # 1comp 2pushes
merge([1,6], halve_and_merge[0,9])
merge([0], [9]) # 1comp 2pushes
merge([1,6], [0,9]) #3comp 4 pushes

merge([0,1,6,9], halve_and_merge[4,7,2,8])

merge(halve_and_merge[4,7], halve_and_merge[2,8])
merge([4], [7]) # 1comp 2pushes
merge([4,7], halve_and_merge[2,8])
merge([2], [8]) # 1comp 2pushes
merge([4,7], [2,8])#3comp 4 pushes

merge([0,1,6,9], [2,4,7,8])#7comp 8pushes

tot_comp: 17, tot_pushes: 24, tot_steps: 41

=end
