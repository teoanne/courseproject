require 'rubygems'
require 'sinatra'
require 'pry'

set :sessions, true

BLACKJACK = 21

helpers do
  
  def calculate_total(cards) 
  array = cards.map {|card| card[1]} 
  total = 0
  array.each do |value|
    if value == "A" 
      total += 11 
    elsif value.to_i == 0 
      total += 10
    else
      total += value.to_i
    end
  end 

    array.select {|card| card.include?("A")}.count.times do
      total -= 10 if total > 21
    end
  total # don't forget to include total here before exiting. IMPORTANT!!
  end # ends the calculate_total helper method

  def card_images(card)
    suit = case card[0]
        when "Clubs" then 'clubs'
        when "Diamonds" then 'diamonds'
        when "Spades" then 'spades'
        when "Hearts" then 'hearts'
      end
    # Values
    value = card[1]
    if ['J', 'Q', 'K', 'A'].include?(value)
    value = case card[1]
      when "J" then 'jack'
      when "Q" then 'queen'
      when "K" then 'king'
      when "A" then 'ace'
    end #ends if
    end #ends value
    "<img src='/images/cards/#{suit}_#{value}.jpg' class='card_display'>"
  end # ends the card images helper method

  def current_total_amount
    if calculate_total(session[:player_cards]).to_i == 21
      @amount.to_i + session[:player_bet].to_i 
    elsif calculate_total(session[:player_cards]).to_i > 21
      @amount.to_i - session[:player_bet].to_i
    elsif calculate_total(session[:dealer_cards]).to_i > 21
      @amount.to_i + session[:player_bet].to_i 
    elsif calculate_total(session[:dealer_cards]).to_i == 21
      @amount.to_i - session[:player_bet].to_i
    elsif calculate_total(session[:player_cards]).to_i > calculate_total(session[:dealer_cards]).to_i
      @amount.to_i + session[:player_bet].to_i 
    else @amount.to_i - session[:player_bet].to_i 
    end # ends if statement
  end # ends current_total_amount method

    def compare_winner
      if calculate_total(session[:player_cards]).to_i > calculate_total(session[:dealer_cards]).to_i
        @success = 'Congratulations, you have the higher score. You win! Your total is now #{current_total_amount}'
      else
        @error = "Sorry, the Dealer's total is higher. Better luck next time #{session[:player_name]}."
      end
    end # ends compare winner method

end # ends Helpers

before do
  @hit_or_stay = true
  @amount = 500
  # @updated_amount = 
end

get '/' do
  if session[:player_name]
   redirect to '/bet'
  else
    redirect to '/new_form'
  end
end

get '/new_form' do
  @message = "Welcome to Blackjack, please enter your name before proceeding."
  #session[:player_name] = gets.chomp.capitalize
  erb :name
end

post '/new_form' do
  if params[:player_name].empty?
  @error = 'You are required to enter your name in order to play.'
  halt erb(:name)
  end

  session[:player_name] = params[:player_name]
  redirect '/bet'
end


post '/hit' do 

  session[:player_newcard] << session[:deck].pop
  session[:dealer_newcard] << session[:deck].pop

  redirect '/game'
end

post '/stay' do
  redirect '/game'
end

get '/bet' do # shows bet form
  if session[:player_name].empty?
    @error = 'Please go back and enter your name before placing a bet.'
    halt erb(:name)
  end
  @amount unless session[:current_total_amount] # not working
  erb :bet
end

post '/player_bet' do # processes bet form. Bet amount cannot be empty
  if params[:player_bet].empty?
  @error = 'You are required to enter a bet amount.'
  halt erb(:bet)
  end

  if params[:player_bet].to_i > @amount.to_i
    @error = 'Please enter an amount below $' + @amount.to_s + '.'
    halt erb(:bet)
  end

  session[:player_bet] = params[:player_bet]
  redirect '/game'
end

get '/player_play_again' do
  session[:current_total_amount]
  erb :game
end

=begin
get '/finished' do

  erb :finished
end
=end
get '/logout' do
  session[:player_name] = false
  redirect '/'
end

post '/game/player/hit' do
  session[:player_cards] << session[:deck].pop
  if calculate_total(session[:player_cards]).to_i > 21
    @error = "Sorry, the total is more than 21. You are busted. You now have $#{current_total_amount} left in your balance."
    @hit_or_stay = false
    current_total_amount = session[:current_total_amount] #NOTE!
  elsif calculate_total(session[:player_cards]).to_i == 21
    @success = "Congratulations, you hit Blackjack! You have a total of $#{current_total_amount}."
    @hit_or_stay = false
  end
  erb :game
end

post '/game/player/stay' do
  @info = "You have chosen to stay. It is now the Dealer's turn."
  @hit_or_stay = false
  erb :game
end

post '/game/dealer/hit' do
  while calculate_total(session[:dealer_cards]).to_i < 17
    session[:dealer_cards] << session[:deck].pop
    if calculate_total(session[:dealer_cards]).to_i > 21
      @error = "The total is more than 21. The Dealer is busted. You win. Your total is now #{current_total_amount}"
      @hit_or_stay = false
    elsif calculate_total(session[:dealer_cards]).to_i == 21
      @success = "Sorry #{session[:player_name]}, Dealer got Blackjack. Better luck next time."
      @hit_or_stay = false
    else
      @info = 'Dealer will stay.'
      compare_winner
    end # ends if statement
  end #ends while statement
  erb :game
end
=begin
post '/game/dealer/stay' do
  @info = "The Dealer will stay."
  erb :game
end
=end

get '/game' do
  suits = ["Hearts", "Clubs", "Diamonds", "Spades"]
  cardnumbers = ["2", "3", "4", "5", "6", "7", "8", "9", "J", "Q", "K", "A"]
  session[:deck] = suits.product(cardnumbers).shuffle!
  #starting off with player and dealer cards
  session[:player_cards] = []
  session[:dealer_cards] = []
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  session[:player_cards] << session[:deck].pop
  session[:dealer_cards] << session[:deck].pop
  erb :game
  # where does the game logic go? 
end


























