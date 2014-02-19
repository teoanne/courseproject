require 'rubygems'
require 'sinatra'
require 'pry'

set :sessions, true

BLACKJACK = 21

helpers do

  def calculate_total(cards) # calculating the total of the two cards dealt, first to player then to dealer
  array = session[:player_cards].map {|card| card[0]} # using the map method to lay out all the cards which are like so [["A", "S"], ["5", "C"]]
  # We then only take the first element of the array and initialize that to the total
  session[:total] = 0 # total at the outset is zero
  array.each do |value|
  if value == "A" # in the event you get an ace card. "A" is as is unlike the bottom ones below
    total += 11 # total should now increase to 11
  elsif value.to_i == 0 # this is to cover for getting J, K, Q cards which defaults value to integer is zero
    total += 10
  else
    total += value.to_i
  end
end 

array.select {|card| card.include?("A")}.count.times do
  total -= 10 if total > 21
end
total # don't forget to include total here before exiting. IMPORTANT!!
end


end




get '/' do
  @message = "Welcome to Blackjack, please enter your name before proceeding."
  #session[:player_name] = gets.chomp.capitalize
  erb :name

end

post '/views/form' do
  session[:player_name] = params[:player_name]
  redirect '/views/bet'
end

post '/views/hit' do # question, how to deal new cards?

  session[:player_newcard] << session[:deck].pop
  session[:dealer_newcard] << session[:deck].pop

  redirect '/views/game'
end

post '/views/stay' do
  redirect '/views/game'
end

get '/views/bet' do
  @amount = "$#{500}"
  session[:player_bet] = @amount.to_i - session[:player_bet].to_i
  erb :bet
end

get '/views/finished' do

  erb :finished
end

get '/views/game' do
  @error = "Something went wrong"
  session[:player_bet]
  suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
  cardnumbers = ["2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]
  session[:deck] = suits.product(cardnumbers)
  session[:deck].shuffle

  #starting off with player and dealer cards
  session[:player_cards] = []
  session[:dealer_cards] = []
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop

  session[:player_total] = calculate_total(session[:player_cards])
  calculate_total(session[:dealer_cards])

  if session[:player_total] == BLACKJACK
  end
  # where does the game logic go?
  
end


























