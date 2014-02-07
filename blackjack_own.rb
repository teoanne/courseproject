# first of all, have a method to calculate everything to be used throughout the program

def calculatetotal(cards) # calculating the total of the two cards dealt, first to player then to dealer
  array = cards.map {|card| card[0]} # using the map method to lay out all the cards which are like so [["A", "S"], ["5", "C"]]
  # We then only take the first element of the array and initialize that to the total
  total = 0 # total at the outset is zero
  array.each do |value|
  if value == "A" # in the event you get an ace card. "A" is as is unlike the bottom ones below
    total += 11 # total should now increase to 11
  elsif value.to_i == 0 # this is to cover for getting J, K, Q cards which defaults value to integer is zero
    total += 10
  else
    total += value.to_i
  end
end # finished the array

# Correcting Aces in case there are more than one. It should convert aces to 1 instead of 11 if more than 1
array.select {|card| card.include?("A")}.count.times do
  total -= 10 if total > 21
end
total # don't forget to include total here before exiting. IMPORTANT!!
end # ends the calculatetotal method

# The deck of cards

suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
cardnumbers = ["2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]

deck = cardnumbers.product(suits)

# Make sure deck is shuffled before handing cards out to players

deck.shuffle!

# Start with empty card deck for player and dealer

player_cards = []
dealer_cards = []

# Cards are dealt to players. Player goes first, followed by dealer. Pop is used to distribute the cards and will reduce the card deck one by one

player_cards << deck.pop
dealer_cards << deck.pop
player_cards << deck.pop
dealer_cards << deck.pop

# Totals for player and dealer

mytotal = calculatetotal(player_cards)
dealertotal = calculatetotal(dealer_cards)

# Now display their cards

puts "Player's cards are: #{player_cards[0]} and #{player_cards[1]} for a total of #{mytotal}"
puts "Dealer's cards are: #{dealer_cards[0]} and #{dealer_cards[1]} for a total of #{dealertotal}"


# Now, player goes first

if mytotal == 21 # simple case of blackjack win
  puts "Congrats you got blackjack!"
exit
end

while mytotal < 21 # if below 21, choose to hit or stay. note that if hit, a new card should be given to the player, if stay, it is dealer's turn
  puts "do you choose to 'hit' or 'stay'"
  reply = gets.chomp.downcase

  if !['hit', 'stay'].include?(reply)
  puts "Please choose to either 'hit' or 'stay'"
  next
  end 

  if reply == 'stay'
    puts "You have chosen to stay, it is now the dealer's turn"
    break
  end

  if reply == 'hit'
    playernewcard = deck.pop
    puts "Your new card is #{playernewcard}"
    player_cards << playernewcard
    mytotal = calculatetotal(player_cards)
    puts "Your new total is #{mytotal}"
  end

if mytotal == 21 # blackjack win after going through hit 
  puts "Yay! Blackjack! You win!"
  exit
  elsif mytotal > 21
  puts "Sorry mate, you are busted"
  exit
end

end # ends the while loop

# Now it is the dealer's turn

if dealertotal == 21
  "Dealer wins. Sorry, better luck next time"
exit
end

while dealertotal < 17
  dealernewcard = deck.pop
  puts "Dealer's new card is: #{dealernewcard}"
  dealer_cards << dealernewcard
  dealertotal = calculatetotal(dealer_cards)
  puts "Dealer's new total is #{dealertotal}"
  if dealertotal == 21
    puts "Dealer got blackjack. Sorry"
  end
end

if dealertotal > 21
  puts "Lucky break. Dealer has busted, so you win"
exit
end

# Comparison between player cards and dealer cards if you have chosen to stay and dealer cards are between 18 to 20

puts "Your cards are #{player_cards} for a total of #{mytotal}"
puts "Dealer's cards are #{dealer_cards} for a total of #{dealertotal}"
puts ""
if mytotal > dealertotal
  puts "Congratulations, you have the bigger total. You win!"
elsif dealertotal > mytotal
  puts "Sorry, dealer's numbers are higher. Dealer wins"
else
  puts "Looks like its a tie"
exit
end




