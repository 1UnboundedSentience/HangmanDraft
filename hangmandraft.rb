class HangmanGame
	def initialize(word)
		@word = word
		@current_word = "_" * word.size
	end

	def current_word
		@current_word
	end

	def word
		@word
	end

	def take_guess(guess_ltr)
		@word.split("").each_with_index do |word_ltr, i|
			if word_ltr == guess_ltr.downcase
				@current_word[i] = guess_ltr.downcase
			end
		end
	end
	def done? 
		if @word == @current_word
			true
		else
			false
		end
	end
end


thewordlist = []
file = File.open("5desk.txt")

file.readlines.each do |line|
	#print line
	#check if within 5-12 characters
	thewordlist.push(line)
end
item = thewordlist[rand(thewordlist.length)]
#print item

#def add_word
#	@listofwords ||= Array.new
#	@listofwords.push(name)
#	@listofwords
#end
#puts add_word

#Last two characters always don't count, they are line breaks
#use some string splicing to remove them

game = HangmanGame.new(item)


15.times do 

	print "Enter your guess of the letter:"
	inLetter = gets.chomp
	game.take_guess(inLetter)
	puts game.current_word
	if game.done?
		puts "YOU WIN!"
		break
	end
end

puts "And the mystery word was " + item