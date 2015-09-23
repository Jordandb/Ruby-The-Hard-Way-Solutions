def wloop(input)
	i = 0
	numbers = []
	
	while i < input
		puts "At the top i is #{i}"
		numbers.push(i)
		i += 1
		puts "Numbers now: ", numbers
		puts "At the bottom i is #{i}"
    end
end

puts "Please define a number for the input while loop: "
input = $stdin.gets.chomp.to_i

wloop(input)