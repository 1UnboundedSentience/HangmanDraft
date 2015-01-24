class HangmanGame
  def initialize(word)
    @word=word
    print word
    @current_word = "_" * (word.size)
  end
  
  def current_word
    @current_word
  end
  
  def set_current_word(word)
    @current_word=word
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



puts "Load previous game? Type 'yes' to load"
gamestatus=gets.chomp
if gamestatus=="yes"
  allsavedprogress=File.read('savedfile.txt')
  
  progressarray=allsavedprogress.split("\n")

  game = HangmanGame.new(progressarray[-1])
  game.set_current_word(progressarray[0])
  numguesses = progressarray[1].to_i
else
  thewordlist = [ ]
  file = File.open("5desk.txt")
  file.readlines.each do |line|
      thewordlist.push(line.chomp)
  end
  filtered_list = thewordlist.select {|temp_item|temp_item.length>5 && temp_item.length<12}
  item = filtered_list[rand(filtered_list.length)]
  game = HangmanGame.new(item)
  numguesses=8
end





numguesses.downto(1) do |count|
  puts "You have " + count.to_s + " guesses left"
  puts "to save the game. type 'save'"
  print "Enter your guess of the letter:"
  userentry = gets.chomp
  

  game.take_guess(userentry)
  puts game.current_word

  if userentry.include? 'save'
   puts "Jason rocks!"
   savedthings = game.current_word + "\n" + count.to_s + "\n" + game.word
   puts savedthings
   File.write('savedfile.txt', savedthings)
   break
  end
  if game.word.include? userentry
    puts "Correct guess!"
  else
    puts "You muppet!  Wrong guess!"
  end
  
  if game.done?
    puts "You WIN!"
    break
  end
end
puts "And the mystery word was " + game.word
