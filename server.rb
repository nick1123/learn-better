require 'sinatra'
require (File.dirname(__FILE__) + '/lib.rb')


class NumberCount
  def self.next
    correct_answer = random_value

    possible_answers = [correct_answer]
    while possible_answers.size < 3 
      value = random_value
      unless possible_answers.include?(value)
        possible_answers << value
      end
    end

    possible_answers.shuffle!
    return {:correct_answer => correct_answer, :possible_answers => possible_answers}
  end

  private

  def self.random_value
    return (rand(9) + 1)
  end
end

get '/' do
  @game_pkg = NumberCount.next

  erb :index
end
