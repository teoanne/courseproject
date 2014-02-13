# Extract nouns and verbs for the blackjack game

# Nouns are Deck, Card, Player, Dealer

# Verbs are deal, shuffle deck, show cards, hit, stay

# Actual gameplay = Blackjack. Encompassed within this is the compare cards method to determine win / lose. Also, if 21 = blackjack. deal cards and stay
  # and its interaction with the dealer and Player

# Abstracting behaviours into classes
require 'rubygems'
require 'pry'

class Card 

  attr_accessor :suit, :value

  def initialize (v, s)
    @suit = s
    @value = v
  end

  def output
    "#{value} of #{find_suit}"
  end

  def find_suit 
    case suit
      when 'H' then 'Hearts'
      when 'S' then 'Spades'
      when 'C' then 'Clubs'
      when 'D' then 'Diamonds'
    end
  end

  def to_s
    output
  end

end # ends the class Card

class Deck # the Object

  attr_accessor :cards, :deal_cards

  def initialize # what are the states of the object?
    @cards = []
    ['H', 'D', 'S', 'C'].each do |s|
    ['2', '3', '4', '5', '6', '7', '8', '9', '10', 'Jack', 'Queen', 'King', 'Ace'].each do |v|
      @cards << Card.new(v, s)
    end
  end
  shuffle_card
end

  def shuffle_card # methods = what action can you perform on the object?
    cards.shuffle!
  end

  def deal_card
    cards.pop
  end

  def size
    "There are #{cards.size} cards left in the deck."
  end

end # ends the class Deck

module Hand

  def show_hand
    puts "------#{name}'s hand is-------"
    cards.each do |card|
      puts "#{card}"
    end
    puts "#{name} has a total of #{total}"
    puts ""
  end

  def total #calculating total

    values = cards.map{ |card| card.value } # value is a Ruby method

    total = 0

    values.each do |v|
      if v == 'Ace'
        total += 11
      elsif v.to_i == 0
        total += 10
      else
        total += v.to_i
      end
    end

      #correcting for Aces
      values.select {|v| v == 'Ace'}.count.times do
        break if total <= 21
        total -= 10
      end
    total
  end

  def hit(new_card)
    cards << new_card
  end

  def stay # no need?
  end

  def is_busted?
    total > 21
  end


  def hit_blackjack?
    total == 21
    puts "You got blackjack"
  end

end

class Player

  include Hand
  attr_accessor :name, :cards

  def initialize(n)
    @name = n
    @cards = []
  end

end

class Dealer

  include Hand
  attr_accessor :name, :cards

  def initialize
    @name = "Dealer"
    @cards = []
  end

  def show_flop
    puts "----- Dealer's hand is ------"
    puts "First card is hidden"
    puts "Second card is #{cards[1]}"
  end

end 

class Blackjack # actual gameplay
  attr_accessor :player, :dealer, :deck, :cards

    BLACKJACK = 21 # constants are capitalized and added to class like so Eg::EG
    DEALER_MIN = 17

  def initialize
    @deck = Deck.new
    @player = Player.new("Player1")
    @dealer = Dealer.new
  end

  def set_player_name
    puts "Welcome to Blackjack, what's your name?"
    player.name = gets.chomp.capitalize
  end

  def deal_cards
    player.hit(deck.deal_card) # note the deck deal_card method in the Deck class
    dealer.hit(deck.deal_card)
    player.hit(deck.deal_card)
    dealer.hit(deck.deal_card)
  end

  def show_cards
    player.show_hand
    dealer.show_flop
  end

  def blackjack_or_bust?(player_or_dealer)

    if player_or_dealer.total > Blackjack::BLACKJACK
      if player_or_dealer.is_a?(Dealer)
      puts "Dealer is busted! #{player.name} wins."
      play_again?
      else
        puts "Sorry #{player.name} busted, Dealer wins."
        play_again?
      end
    end

    if player_or_dealer.total == Blackjack::BLACKJACK
      if player_or_dealer.is_a?(Dealer)
        puts "Sorry, Dealer got blackjack, #{player.name} lost."
        play_again?
      else
        puts "#{player.name} got blackjack! #{player.name} won!"
        play_again?
      end
    end
  end

  def player_turn
    puts ""
    puts "It is now #{player.name}'s turn." # replicates the logic of the procedural blackjack game

    blackjack_or_bust?(player)

    while !player.is_busted?
      puts "What would you like to do? Please type 'hit' or 'stay'."
      reply = gets.chomp.downcase

      if !['hit', 'stay'].include?(reply) # checking for reply
        puts "Please choose to either 'hit' or 'stay'."
        next
      end
      
      if reply == 'stay' # if player chooses to stay
          puts "#{player.name} chose to stay at #{player.total}."
          puts ""
        break
      end

        # hit
        player_new_card = deck.deal_card
        puts "#{player.name} new card is: #{player_new_card}."
        player.hit(player_new_card)
        puts "#{player.name} total is now #{player.total}."

        blackjack_or_bust?(player)
     end # closes the while loop
        puts "--------------------------------"
        puts "It is now the Dealer's turn." # replicates the logic of the procedural blackjack game
  end # closes player turn

  def dealer_turn

    blackjack_or_bust?(dealer)

    while dealer.total < Blackjack::DEALER_MIN
      dealer_new_card = deck.deal_card
      puts "Dealer's new card is: #{dealer_new_card}."
      dealer.hit(dealer_new_card)
      puts "Dealer's total is now #{dealer.total}."
      blackjack_or_bust?(dealer) 
      end

      puts "Dealer stays at #{dealer.total}."

      if dealer.total < Blackjack::BLACKJACK
      puts "We will now compare the totals between Dealer and #{player.name}."
      puts "--------------------------------"
      compare_total  
      play_again?
      end

  end # closes dealer turn

  def compare_total
    if player.total > dealer.total
      puts "#{player.name} wins. #{player.name} has the bigger number!"
      
    elsif player.total == dealer.total
      puts "Lucky break. Its a tie between you two."
      
    else
      puts "Sorry, the Dealer won this time. Try again next time."
      
    end
  end # ends compare helper method

  def play_again?
    puts "Would you like to play another round of Blackjack? Please type 'yes' or 'no'."
    reply = gets.chomp.downcase
    if reply == 'yes'
      puts "Ok, let's go for another round then. Starting the new game....."
      deck = Deck.new # has to have a new deck because card count from deck decreased from the previous game
      player.cards = [] # both player and dealer's cards need to be reset from the previous game
      dealer.cards = []
      run
    else
      puts "Exiting the game....Thanks for playing."
      exit
    end
  end

  def run
    set_player_name
    deal_cards
    show_cards
    player_turn
    dealer_turn
    compare_total # player and dealer
  end
end


game = Blackjack.new
game.run

