require 'open-uri'

WORD_URL = "http://learncodethehardway.org/words.txt"
WORDS = []

# array containing hashes with key-value pairs as questions and answers
PHRASES = {
  "class ### < ###\nend" =>
       "Make a class named ### that is-a ###.",
  "class ###\n\tdef initialize(@@@)\n\tend\nend" =>
       "class ### has-a initialize that takes @@@ parameters.",
  "class ###\n\tdef ***(@@@)\n\tend\nend" =>
       "class ### has-a function named *** that takes @@@ parameters.",
  "*** = ###.new()" =>
       "Set *** to an instance of class ###.",
  "***.***(@@@)" =>
       "From *** get the *** function, and call it with parameters @@@.",
  "***.*** = '***'" =>
       "From *** get the *** attribute and set it to '***'."
}

PHRASE_FIRST = ARGV[0] == "english"

open(WORD_URL) {|f|
  f.each_line {|word| WORDS.push(word.chomp)}
}

def craft_names(rand_words, snippet, pattern, caps=false)

  # looks into our question/snippet and searches our pattern, then for every match of the pattern it will
  # give us a random word. So for instance if we have a question with: "class ### < ###\nend"
  # we find two times ### which means our loop is executed two times. The result from our map is that it 
  # returns a new array with the two random words.
  names = snippet.scan(pattern).map do
    word = rand_words.pop()

    # if caps then word.capitalize, else word
    caps ? word.capitalize : word
  end

  return names * 2
end

def craft_params(rand_words, snippet, pattern)

  # scans our question/snippet for a pattern for ex: @@@, then calls .length on it for ex: 2. Then loops 0...2 times
  # through our do-loop and returns an array
  names = (0...snippet.scan(pattern).length).map do
    param_count = rand(3) + 1
    params = (0...param_count).map {|x| rand_words.pop() }
    params.join(', ')
  end

  return names * 2
end

def convert(snippet, phrase)
  # take all the words and sort at random
  rand_words = WORDS.sort_by {rand}

  # for ex    = craft_names(rand_words, "class ### < ###\nend", /###/, caps=true) and could return 4 words like 
  # "Foo", "Bar", "Foo", "Bar" -> because of the return times two in craft_params
  class_names = craft_names(rand_words, snippet, /###/, caps=true)
  other_names = craft_names(rand_words, snippet, /\*\*\*/)
  param_names = craft_params(rand_words, snippet, /@@@/)

  results = []

  [snippet, phrase].each do |sentence|
    # fake class names, also copies sentence
    result = sentence.gsub(/###/) {|x| class_names.pop }

    # fake other names
    result.gsub!(/\*\*\*/) {|x| other_names.pop }

    # fake parameter lists
    result.gsub!(/@@@/) {|x| param_names.pop }

    results.push(result)
  end

  return results
end

# keep going until they hit CTRL-D
loop do
  # take only the keys from the key-value pairs out of the array of phrases, 
  # then sort them in random order and store them in a var called snippets
  # we now haven an unorderd list of keys which are in this case strings of Questions!!
  snippets = PHRASES.keys().sort_by {rand}

  # p snippets    # this command is the same as puts array.inspect but shorter -> prints out array

  # for every key in the array do a for loop
  for snippet in snippets
    # puts snippet = question

    # searches array of Phrases and looks for the corresponding answer where the key is question
    # so phrase is the answer..
    phrase = PHRASES[snippet]
    # puts phrase
    question, answer = convert(snippet, phrase)

    if PHRASE_FIRST
      question, answer = answer, question
    end

    print question, "\n\n> "

    exit(0) unless $stdin.gets

    puts "\nANSWER:  %s\n\n" % answer
  end
end
