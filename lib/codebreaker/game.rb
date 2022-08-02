require_relative 'validator'
require '././lib/codebreaker/errors/no_attempts_left_error'
require '././lib/codebreaker/errors/no_hints_left_error'

module CodeBreaker
  class Game
    attr_reader :name, :difficulty, :secret_code, :difficulty_hash, :used_attempts, :used_hints, :hints

    def initialize(params)
      CodeBreaker::Validator.validates_name? params[:name]
      @name = params[:name]
      @difficulty = params[:difficulty].downcase
      @used_attempts = 0
      @used_hints = 0
      @secret_code = params[:secret_code]
      @hints = 0
      @difficulty_hash = { easy: { attempts: 15, hints: 2 },
                           medium: { attempts: 10, hints: 1 },
                           hell: { attempts: 5, hints: 1 } }
    end

    def guess(user_code)
      raise CodeBreaker::NoAttemptsLeftError if @used_attempts == @difficulty_hash[@difficulty.to_sym][:attempts]
      return '' if user_code.nil?

      CodeBreaker::Validator.validates_input? user_code
      codes = code_to_array(user_code, @secret_code)
      result_string = get_result_from_input(codes[:input], codes[:secret])
      @used_attempts += 1
      result_string.chars.sort.join
    end

    def receive_hint
      raise CodeBreaker::NoHintsLeftError if @used_hints == @difficulty_hash[@difficulty.to_sym][:hints]

      @used_hints += 1
      @hints = rand(0..3)
      rand_position = rand(0..3) while @hints != rand_position
      @secret_code.to_s.chars[rand_position]
    end

    private

    def get_result_from_input(user_code, secret_copy)
      result_string = ''
      user_code.each do |digit|
        next unless secret_copy.include?(digit)

        result_string << (user_code.find_index(digit) == secret_copy.find_index(digit) ? '+' : '-')
        secret_copy[secret_copy.find_index(digit)] = 0
      end
      result_string
    end

    def code_to_array(input_code, secret_code)
      input_code = input_code.to_s.chars.map(&:to_i)
      secret_code = secret_code.to_s.chars.map(&:to_i)
      { input: input_code, secret: secret_code }
    end
  end
end
