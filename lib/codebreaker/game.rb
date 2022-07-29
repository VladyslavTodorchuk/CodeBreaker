# frozen_string_literal: false

module CodeBreaker
  class Game
    attr_reader :name, :difficulty, :total_attempts, :used_attempts, :total_hints, :used_hints

    def initialize(params)
      @name = params[:name]
      @difficulty = params[:difficulty]
      @total_attempts = params[:total_attempts]
      @used_attempts = params[:used_attempts]
      @total_hints = params[:total_hints]
      @used_hints = params[:used_hints]
    end

    def check_user_input(secret_code, user_code)
      result_string = ''
      user_code.each do |digit|
        next unless secret_code.include?(digit)

        result_string << '+' if user_code.find_index(digit) == secret_code.find_index(digit)
        result_string << '-' unless user_code.find_index(digit) == secret_code.find_index(digit)
        user_code[user_code.find_index(digit)] = 0
        secret_code[secret_code.find_index(digit)] = 0
      end
      @used_attempts += 1
      result_string.chars.sort.join
    end

    def receive_hint; end
  end

  class CodeMaker
    attr_reader :code

    def initialize
      @code = []
      4.times { @code << rand(1..6) }
    end
  end
end
