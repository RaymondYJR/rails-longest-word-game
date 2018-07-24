require 'open-uri'
require 'json'

class GamesController < ApplicationController
  def new
    @letters = []
    10.times do
      @letters << ('A'..'Z').to_a.sample
    end
  end

  def score
    url = "https://wagon-dictionary.herokuapp.com/#{params[:answer]}"
    raw_response = open(url).read
    response = JSON.parse(raw_response)
    if response["found"] == false
      @score = [0, "your entry is not a word"]
    else
      @score = [params[:answer].length, "congratulations!"]
    end
  end
end
