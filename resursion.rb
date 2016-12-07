#recursive function to repeat a word n number of times
def repeat(n, word)
  puts word
  if n == 1
    return
  else
    repeat(n-1, word)
  end
end
repeat(5, "hello")
# hello
# hello
# hello
# hello
# hello

#recursive function to print out even numbers, must put in even number as a argument
def even(n)
  if n.odd?
    puts "Please put an even number only"
  elsif
    puts n
  elsif n == 0
    return
  else
    even(n - 2)
  end
end
even(10)
# 10
# 8
# 6
# 4
# 2
# 0

#recursive fibonacci sequence up to any_number you want:
def fibonacci(num1 = 1, num2 = 1)
  p [num1, num2]
  if num2 >= 987
    return
  else
    fibonacci(num1 = (num1 + num2), num2 = (num2 + num1))
  end
end
fibonacci
# [1, 1]
# [2, 3]
# [5, 8]
# [13, 21]
# [34, 55]
# [89, 144]
# [233, 377]
# [610, 987]

#recursive sum function:
def recursive_sum(sum = 0, arr)
  if arr.empty?
    puts sum
  elsif
    recursive_sum(sum += arr.pop,  arr)
  end
end
recursive_sum([3,2,1,4,20])
#30

#recursive reversing
def reverse_recursion(string, reverse = "")
  if string.length == 0
    return reverse
  else
    arr = string.split("")
    reverse << arr.pop
    reverse_recursion(arr.join, reverse)
  end
end
puts reverse_recursion("hello is there anyone out there")
#ereht tuo enoyna ereht si olleh

#recursive remainder
def recursive_remainder(numerator, denominator)
  if (numerator - denominator) >= denominator
    numerator = (numerator - denominator)
    recursive_remainder(numerator, denominator)
  else
    puts numerator - denominator
  end
end
recursive_remainder(10, 4)
#2

#recursive binary search
def binary_search(array, value, from=0, to=0)
    if to == 0
        to = array.count - 1
    end

    mid = (from + to) / 2

    if value < array[mid]
        return binary_search array, value, from, mid - 1
    elsif value > array[mid] #(18 > 5) T
        return binary_search array, value, mid + 1, to
    else
        return "#{array[mid].to_s} is located at index #{mid}"
    end
end

puts binary_search([4,5,8,18,29,45,54,90,210], 18)
#biary search via recursion
#stack = [
#binary_search(array, value, from = 0, to = 3),
#binary_search(array, value, from = 2, to = 3),
#binary_search(array, value, from = 3, to = 3) <--base cased reached, will output "18 is located at index 3"
#]

#recursive power:
def recursive_power(num1, num2, power = 1)
  if num2 == 0
    return power
  elsif power < 1
    power = num1 * num1
    recursive_power(num1, (num2 - 1), power)
  else
    power = power * num1
    recursive_power(num1, (num2 - 1), power)
  end
end
puts recursive_power(2, 5)
#32

#Method for recursive anagrams(does not account for letters that repeat)
def recursive_anagram(string, anagram_array = [])
  anagram = string.split("").shuffle.join
  if anagram_array.length == string.length.downto(1).to_a.inject(:*)
    return anagram_array
  else
    anagram_array << anagram unless anagram_array.include?(anagram)
    recursive_anagram(string, anagram_array)
  end
end

p recursive_anagram("cat")
