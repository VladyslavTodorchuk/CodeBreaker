require_relative './errors/validator_error'
require_relative './constants'

module CodeBreaker
  class Validator
    def self.validates_name(name)
      raise ValidatorError, 'Name is nil' if name.nil?

      raise ValidatorError, 'Name is not instance of String' unless name.instance_of?(String)

      max_length = CodeBreaker::Constants::MAX_NAME_LENGTH
      min_length = CodeBreaker::Constants::MIN_NAME_LENGTH
      unless (min_length..max_length).cover?(name.length)
        raise ValidatorError, "Name length must be between #{min_length} and #{max_length} chars"
      end

      nil
    end

    def self.validates_input(input)
      raise ValidatorError, 'Input is nil' if input.nil?

      raise ValidatorError, 'Input is not instance of Integer' unless input.instance_of? Integer

      input = input.to_s
      max, min = CodeBreaker::Constants::MAX_DIGIT, CodeBreaker::Constants::MIN_DIGIT
      unless input.match(/^[1-6]{4}+$/)
        raise ValidatorError,
              "Input should consists of (#{min}-#{max}) digits and length #{CodeBreaker::Constants::MAX_LENGTH_CODE}"
      end

      nil
    end

    def self.validates_difficulty(difficulty)
      raise ValidatorError, 'Difficulty is nil' if difficulty.nil?

      raise ValidatorError, 'Difficulty is not instance of String' unless difficulty.instance_of? String

      unless CodeBreaker::Constants::DIFFICULTY_HASH.keys.include?(difficulty.to_sym)
        raise ValidatorError,
              'There no such difficulty'
      end

      nil
    end
  end
end
