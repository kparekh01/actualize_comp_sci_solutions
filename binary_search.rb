def binary_search(array, value, from=0, to=0)
    if to == 0
        to = array.count - 1
    end

    mid = (from + to) / 2 #(3/2)1

    if value < array[mid]
        return binary_search array, value, from, mid - 1 # binary_search array, value, from, mid - 1 (to = 3)
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
