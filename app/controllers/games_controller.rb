require 'open-uri'

class GamesController < ApplicationController
  def new
    @letters = Array.new(9) { ('A'..'Z').to_a.sample }.join
  end

  def score
    @word = params[:word]
    @result = english_word?(@word)
  end

  def english_word?(word)
    url = "https://wagon-dictionary.herokuapp.com/#{word}"
    doc = open(url)
    @response = JSON.parse(doc.read)
    if @response['found']
      @final_answer = "#{@response['word']} is a valid word!"
    else
      @final_answer = "#{@response['word']} is not a valid word"
    end
  end
end
