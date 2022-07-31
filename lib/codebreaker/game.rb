require_relative 'validator'

module CodeBreaker
  class Game
    attr_reader :name, :difficulty, :secret_code, :difficulty_hash

    def initialize(params)
      @name = params[:name]
      @difficulty = params[:difficulty].downcase
      @used_attempts = 0
      @used_hints = 0
      @secret_code = params[:secret_code]
      @difficulty_hash = { easy: { attempts: 15, hints: 2 },
                           medium: { attempts: 10, hints: 1 },
                           hell: { attempts: 5, hints: 1 } }
    end

    def guess(user_code)
      return 'No attempts left' if @used_attempts == @difficulty_hash[@difficulty.to_sym][:attempts]
      return '' if user_code.nil?

      user_code, secret_copy = code_mapper(user_code, @secret_code)
      result_string = get_result_from_input(user_code, secret_copy)
      @used_attempts += 1
      result_string.chars.sort.join
    end

    def get_result_from_input(user_code, secret_copy)
      result_string = ''
      user_code.each do |digit|
        next unless secret_copy.include?(digit)

        result_string << (user_code.find_index(digit) == secret_copy.find_index(digit) ? '+' : '-')
        secret_copy[secret_copy.find_index(digit)] = 0
      end
    end

    def receive_hint
      return 'No hints left' if @used_hints == @difficulty_hash[@difficulty.to_sym][:hints]

      @used_hints += 1
      rand_position = rand(0..3)
      @secret_code.to_s.chars[rand_position]
    end

    private

    def code_mapper(user_code, secret_code)
      [user_code.to_s.chars.map(&:to_i), secret_code]
    end
  end
end
