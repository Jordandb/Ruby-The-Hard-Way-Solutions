animals = ['bear', 'ruby', 'peacock', 'kangeroo', 'whale']
count = 0
animals.each do |i|
	puts "#{i} is number #{count} in the array."
	count = count + 1
end

puts "---------------------------------------"

# or we can use the each_with_index method
animals.each_with_index do |i, index|
	puts "#{i} is number #{index} in the array."
end