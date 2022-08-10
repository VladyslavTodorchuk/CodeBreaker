require_relative 'validator'
require_relative './errors/no_attempts_left_error'
require_relative './errors/no_hints_left_error'
require_relative './errors/no_command_error'
require_relative './constants'

module CodeBreaker
  class Game
    attr_reader :name, :difficulty, :secret_code, :hints
    attr_accessor :used_attempts, :used_hints, :total_hints, :total_attempts

    def initialize(params)
      @name = params[:name]
      @difficulty = params[:difficulty] if CodeBreaker::Validator.validates_difficulty(params[:difficulty]).nil?
      @secret_code = params[:secret_code]
      @clonned_secret = @secret_code.clone
      @total_attempts = CodeBreaker::Constants::DIFFICULTY_HASH[@difficulty.to_sym][:attempts]
      @total_hints = CodeBreaker::Constants::DIFFICULTY_HASH[@difficulty.to_sym][:hints]
      @used_attempts, @used_hints = 0, 0
    end

    def guess(user_code)
      raise CodeBreaker::NoAttemptsLeftError if @used_attempts == @total_attempts

      CodeBreaker::Validator.validates_name(@name).nil?
      CodeBreaker::Validator.validates_input user_code
      user_code = user_code.to_s.chars.map(&:to_i)
      result_string = get_result_from_input(user_code, @secret_code.clone)

      @used_attempts += 1
      result_string
    end

    def receive_hint
      raise CodeBreaker::NoHintsLeftError if @used_hints == @total_hints

      @used_hints += 1
      @clonned_secret.shuffle!.pop
    end

    def get_result_from_input(user_code, secret_copy)
      result_string = ''
      user_code.each do |digit|
        next unless secret_copy.include?(digit)

        result_string << (user_code.find_index(digit) == secret_copy.find_index(digit) ? '+' : '-')
        secret_copy[secret_copy.find_index(digit)] = CodeBreaker::Constants::DIGIT_THAT_BEEN_USED
        user_code[user_code.find_index(digit)] = CodeBreaker::Constants::DIGIT_THAT_BEEN_USED
      end
      result_string.chars.sort.join
    end
  end
end
