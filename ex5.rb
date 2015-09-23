my_name = 'Jordan De Braekell'
my_age = '26' # yes it's true..
my_height = 1.70 # meters
my_weight = 'Dont know by heart'
my_eyes = 'Blue'
my_teeth = 'White'
my_hair = 'Brown'

puts "Let's talk about #{my_name}"
puts "He's #{my_height} meters tall."
puts "He's #{my_weight} how much he weighs."
puts "Because he doesn't own a scale."
puts "He's got #{my_eyes} eyes and #{my_hair} hair."
puts "His teeth are usually #{my_teeth} depending on the coffee and sigarettes."

# this line is tricky, try to get it exactly right -> we have to transform string my_age to float with .to_f
puts "If I add #{my_age}, #{my_height}. I get #{my_age.to_f + my_height}."



