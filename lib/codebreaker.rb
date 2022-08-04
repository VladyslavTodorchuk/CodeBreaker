require_relative 'codebreaker/game'
require_relative 'codebreaker/code_maker'
require_relative './codebreaker/errors/no_attempts_left_error'
require_relative './codebreaker/errors/no_hints_left_error'
require_relative './codebreaker/errors/validator_error'

# Description/Explanation CodeBreaker Game
module CodeBreaker
  class CodeBreakerGame
    attr_reader :game

    def initialize(user_name, difficulty)
      generated_code = CodeBreaker::CodeMaker.generate_code
      @game = CodeBreaker::Game.new(name: user_name, secret_code: generated_code, difficulty:)
    end

    def action(command, input = nil)
      case command
      when :guess
        @game.guess input
      when :hint
        @game.receive_hint
      else
        raise CodeBreaker::NoCommandError, "No such command #{command}"
      end
    end
  end
end
