module CodeBreaker
  class CodeBreakerGame
    attr_reader :game

    def initialize(user_name, game_difficulty)
      generated_code = CodeBreaker::CodeMaker.generate_code
      @game = CodeBreaker::Game.new(name: user_name, secret_code: generated_code, difficulty: game_difficulty)
    end

    def action(command, input = nil)
      case command
      when :guess
        @game.guess input
      when :hint
        @game.receive_hint
      else
        raise CodeBreaker::NoCommandError
      end
    end
  end
end
