class Cell

    attr_accessor :data, :next_cell_location

    def initialize(data, next_in_location)
        @data = data
        @next_cell_location = next_cell_location
        puts "Initialized a Cell with data:  " + data.to_s
    end
end

class LinkedList

    def initialize(val)
        # Initialize a new cell at the beginning of computer memory,
        # first empty cell computer can find in memory.
        @first_cell = Cell.new(val,nil)
    end

    def add(value)
        # Go to the end of the list
        # And insert a new node over there with the specified value
        current = @first_cell
        while current.next_cell_location != nil
            current = current.next_cell_location
        end
        current.next_cell_location = Cell.new(value,nil)
        self
    end

    def delete(val)
        current = @first_cell
        if current.data == val
            # If the first cell is the element to be deleted, the first element needs to be updated
            @first_cell = @first_cell.next_cell_location
        else
            # ... x -> y -> z
            # Suppose y is the value to be deleted, you need to reshape the above list to :
            #   ... x->z
            # ( and z is basically y.next_node )
            current = @first_cell
            while (current != nil) && (current.next_cell_location != nil) && ((current.next_cell_location).data != val)
                current = current.next_cell_location
            end

            if (current != nil) && (current.next_cell_location != nil)
                current.next_cell_location = (current.next_cell_location).next_cell_location
            end
        end
    end

    def display
        current = @first_cell
        full_list = []
        while current.next_cell_location != nil
            full_list += [current.data]
            current = current.next_cell_location
        end
        full_list += [current.data.to_s]
        puts full_list.join("->")
    end

end



# # Initializing a Linked List with a node containing value (5)
linked_list_1 = LinkedList.new("first element of ll")
# Adding Elements to Linked List
linked_list_1.add("second element of ll")
linked_list_1.add("third element of ll")
puts "***************************************************************"
# Display the Linked List
puts "Displaying Linked List 1:"
linked_list_1.display
puts "***************************************************************"
linked_list_1.add("fourth element of ll")
puts "***************************************************************"
puts "Displaying Linked List 1:"
linked_list_1.display
puts "***************************************************************"
puts "Delete second element and then display the linked list:"
linked_list_1.delete("second element of ll")
linked_list_1.display

#output below
# Initialized a Cell with data:  first element of ll
# Initialized a Cell with data:  second element of ll
# Initialized a Cell with data:  third element of ll
# ***************************************************************
# Displaying Linked List 1:
# first element of ll->second element of ll->third element of ll
# ***************************************************************
# Initialized a Cell with data:  fourth element of ll
# ***************************************************************
# Displaying Linked List 1:
# first element of ll->second element of ll->third element of ll->fourth element of ll
# ***************************************************************
# Delete second element and then display the linked list:
# first element of ll->third element of ll->fourth element of ll
