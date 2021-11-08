require 'json'
require 'open-uri'

class GamesController < ApplicationController
  def new
    alphabet = ('a'..'z').to_a
    @letters = alphabet.sample(10)
  end

  def score
#The word can’t be built out of the original grid
answer_array = params[:answer].split("")
@letters = params[:letters].split
@letterinclude = true

answer_array.each do |letter|
  if @letters.include?(letter)
  else
    @letterinclude = false
  end
  end
end


url = 'https://wagon-dictionary.herokuapp.com/'
user_serialized = URI.open(url).read
user = JSON.parse(user_serialized)

puts "#{user['name']} - #{user['bio']}"

end
