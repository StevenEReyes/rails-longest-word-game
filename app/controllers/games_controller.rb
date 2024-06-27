require 'open-uri'
require 'json'

class GamesController < ApplicationController

  def new
    @letters = ("a".."z").to_a.sample(10)
  end

  def score
    @user_word = params[:word]
    @letters = params[:letters]
    letters_array = params[:letters].chars

    @word_valid = @user_word.chars.all? do |letter|
      @user_word.count(letter) <= letters_array.count(letter)
    end

    url = "https://dictionary.lewagon.com/#{@user_word}"

    dictionary = URI.open(url).read
    @english_check = dictionary["found"]
    @word_length = dictionary["length"]
  end
end
