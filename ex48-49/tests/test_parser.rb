require 'ex48/parser.rb'
require "minitest/autorun"

class TestParser < Minitest::Test

	subject = ['noun','princess']
	verb = ['verb','kill']
	obj = ['obj','it']
	@@word_list = [['noun','princess'], ['verb','kill'], ['obj','it']]
	@@my_sentence = Sentence.new(subject, verb, obj)

	def test_sentence_initialize()
	    assert_equal(@@my_sentence.instance_variable_get(:@subject), "princess")
	    assert_equal(@@my_sentence.instance_variable_get(:@verb), "kill")
	    assert_equal(@@my_sentence.instance_variable_get(:@object), "it")
	end

	def test_peek()
		# if nil is given it should return nil
		assert_equal(nil, Parser.peek(nil))
		
		# return first element of word-pairs, for ex. return noun of non-princess
		assert_equal('noun', Parser.peek(@@word_list))
	end

	def test_match()
		# return nil if nil is given
		assert_equal(nil, Parser.match(nil, nil))

		# return first element of word_list
		assert_equal(@@word_list[0], Parser.match(@@word_list, 'noun'))

		# return nil if first element of first object is NOT equal to expecting
		assert_equal(nil, Parser.match(@@word_list, 'something_false'))
	end

	def test_skip()
		assert_equal(nil, Parser.skip(nil, 'noun'))
	end

	def test_parse_verb()
		assert_equal(['verb','kill'], Parser.parse_verb([['stop','the'], ['verb','kill']]))
	
		assert ParserError do
			Parser.parse_verb(['error','something_false'])
		end
	end

	def test_parse_object()
		assert_equal(['noun','princess'], Parser.parse_object([['stop','the'], ['noun','princess'], ['verb','kill']]))

		assert_equal(['direction','up'], Parser.parse_object([['stop','the'], ['direction','up'], ['noun','princess']]))
	
		assert ParserError do
			Parser.parse_object(['error','something_false'])
		end
	end

	def test_parse_subject()
		assert_equal(['noun','princess'], Parser.parse_subject([['stop','the'], ['noun','princess'], ['verb','kill']]))
		assert_equal(['noun','player'], Parser.parse_subject([['stop','the'], ['verb','kill'], ['noun','princess']]))
	
		assert ParserError do
			Parser.parse_subject(['error','something_false'])
		end
	end

	def test_parse_sentence()
		sentence = Sentence.new(['noun','princess'], ['verb','kill'], ['noun','it'])
		assert_equal(sentence, Parser.parse_sentence([['noun','princess'], ['verb','kill'], ['noun','it']]))
	end
end