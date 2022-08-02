require_relative 'codebreaker/game'
require_relative 'codebreaker/code_maker'
require './lib/codebreaker/errors/no_attempts_left_error'
require './lib/codebreaker/errors/no_hints_left_error'
require './lib/codebreaker/errors/validator_error'

# Description/Explanation CodeBreaker Game
module CodeBreaker
  class CodeBreakerGame
    attr_reader :game

    def start_game(name, difficulty)
      secret_code = CodeBreaker::CodeMaker.generate_code
      @game = CodeBreaker::Game.new(name:, secret_code:, difficulty:)
    end

    def action(command, input = nil)
      case command
      when :guess
        @game.guess input
      when :hint
        @game.receive_hint
      else
        raise NoMethodError, "No such command #{command}"
      end
    end
  end
end
