filename = ARGV.first

puts "We're going to erase #{filename}"
puts "If you don't want that, hit CTRL-C. "
puts "If you do want tat, hit RETURN."

$stdin.gets

puts "Opening the file..."

# opens command uses argument 'w' which indicates a write only permission
# we could also use other permissions such as r for read only; ...
target = open(filename, 'w')

puts "Truncating the file. Goodbye!"

# truncates everything from the first character
# read more http://apidock.com/rails/String/truncate
target.truncate(0)

puts "Now i'm going to ask you for three lines."

print "line 1: "
line1 = $stdin.gets.chomp
print "line 2: "
line2 = $stdin.gets.chomp
print "line 3: "
line3 = $stdin.gets.chomp

puts "I'm going to write these to the file."

target.write(line1)
target.write("\n")
target.write(line2)
target.write("\n")
target.write(line3)
target.write("\n")

# Below code makes more sense because we can use all the above in just one command. 
# Even better would be to add a loop to avoid even more repitition...
target.write("#{line1} \n#{line2} \n#{line3}\n")

puts "And finally, we close it."
target.close  