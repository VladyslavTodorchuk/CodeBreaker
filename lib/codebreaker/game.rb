
module CodeBreaker
  class Game
    attr_reader :name, :difficulty, :total_attempts, :used_attempts, :total_hints, :used_hints

    def initialize(params)
      @name = params[:name]
      @difficulty = params[:difficulty]
      @total_attempts = params[:total_attempts]
      @used_attempts = params[:used_attempts]
      @total_hints = params[:total_attempts]
      @used_hints = params[:used_hints]
    end

    def check_user_input(code_maker_code, user_code)

    end

    def get_hint

    end

  end

  class CodeMaker
    attr_reader :code

    def initialize
      mult = 1
      4.times do
        @code += (1 + rand(6)) * mult
        mult *= 10
      end
    end

  end
end