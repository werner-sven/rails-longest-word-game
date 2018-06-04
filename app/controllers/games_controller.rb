require 'pry-byebug'

class GamesController < ApplicationController

  def new
    @letters = random_letters
  end

  def score
    @user_word = params["word"]
    @letters = params["letters"]
    @in_letters = word_consists_letters?(@user_word, @letters)

  end

      def random_letters
        letters = []
        10.times do
          letters << ('a'..'z').to_a.sample
        end
        return letters
      end

      def word_consists_letters?(word, letters)
        user_word_array = word.split(//)
        letters_array = letters.split(//)
        x = true
        user_word_array.each do |user_letter|
          index_delete = letters_array.find_index {|letter| letter == user_letter }
          if index_delete == nil
            then x = false
          else
            letters_array.delete_at(index_delete)
          end
        end
        return x
      end



end


