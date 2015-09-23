class Lexicon

	def self.scan(words)

		directions = ["north", "east", "south", "west", "up", "down", "right", "left", "back"]
		verbs = ["go", "stop", "kill", "eat"]
		stop = ["the", "in", "of", "from", "at", "it"]
		nouns = ["door", "bear", "princess", "cabinet"]

		words = words.split

		@@sentence = []

		def self.push_to_sentence(type, word)
			pair = [type , word]
			@@sentence.push(pair)
		end

		def self.check_if_number(word)
			if word.to_i.to_s == word
				push_to_sentence('number', word.to_i)
			else
				push_to_sentence('error', word)
			end
		end

		for word in words
			if directions.include? word
				push_to_sentence('direction', word)
			elsif verbs.include? word
				push_to_sentence('verb', word)
			elsif nouns.include? word
				push_to_sentence('noun', word)
			elsif stop.include? word
				push_to_sentence('stop', word)
			else
				check_if_number(word)
			end
		end
		return @@sentence
	end
end

