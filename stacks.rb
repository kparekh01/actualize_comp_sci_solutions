class Linter
  attr_reader :error

  def initialize
    @stack = []
  end

  def lint(text)
    text.each_char.with_index do |char, index|
      if opening_brace?(char)
        @stack.push(char)
      elsif closing_brace?(char)
        if closes_most_recent_opening_brace?(char)
          @stack.pop
        else
          @error = "Incorrect closing brace: #{char} at index #{index}"
          return @error
        end
      end
    end
    @stack.any? ? @error = "#{@stack.last} does not have a closing brace" : @error = "Everything looks good!"
  end


  private

  def opening_brace?(char)
    ["(", "[", "{"].include?(char)
  end

  def closing_brace?(char)
    [")", "]", "}"].include?(char)
  end

  def opening_brace_of(char)
    {")" => "(", "]" => "[", "}" => "{"}[char]
  end

  def most_recent_opening_brace
    @stack.last
  end

  def closes_most_recent_opening_brace?(char)
    opening_brace_of(char) == most_recent_opening_brace
  end
end


linter = Linter.new
linter.lint("( var x = { y: [1, 2, 3] } )")
puts linter.error

puts "************************************************"
bad_linter = Linter.new
bad_linter.lint("( var x = { y: [1, 2, 3] ) }")
puts bad_linter.error

puts "************************************************"
missing_linter = Linter.new
missing_linter.lint("( var x = { y: [1, 2, 3] }")
puts missing_linter.error

# output below:
# Everything looks good!
# ************************************************
# Incorrect closing brace: ) at index 25
# ************************************************
# ( does not have a closing brace


#Reverse a stack using 
def stack_reverse(str)
  stack = []
  i = 1
  while i < (str.length + 1)
  stack.push(str.split("")[-i])
  i += 1
  end
  stack.join
end

puts stack_reverse("This String")
#output:
#gnirtS sihT
