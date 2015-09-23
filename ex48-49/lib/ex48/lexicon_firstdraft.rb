directions = ["north", "east", "south", "west", "up", "down", "right", "left", "back"]
verbs = ["go", "stop", "kill", "eat"]
stop_words = ["the", "in", "from", "at", "it"]
nouns = ["door", "bear", "princess", "cabinet"]


lexicon = [directions, verbs, stop, nouns]
p lexicon


print "Give me a sentence: "
words = $stdin.gets.chomp
words = words.split	


for word in words 
	sentence = []
	part_sentence = Array.new
	
	lexicon.each { |a| 

		if a.include? word
			sentence.push(word)
		end
	}

  	p sentence
end


