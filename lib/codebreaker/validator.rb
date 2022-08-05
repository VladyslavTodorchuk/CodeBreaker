require_relative './errors/validator_error'
require_relative './constants'

module CodeBreaker
  class Validator
    def self.validates_name?(name)
      raise ValidatorError, 'Name is nil' if name.nil?

      raise ValidatorError, 'Name is not instance of String' unless name.instance_of?(String)

      max_length = CodeBreaker::Constants::MAX_NAME_LENGTH
      min_length = CodeBreaker::Constants::MIN_NAME_LENGTH
      unless (min_length..max_length).cover?(name.length)
        raise ValidatorError,
              "Name length less then #{min_length} high then #{max_length}"
      end

      true
    end

    def self.check_digits(input)
      max, min = CodeBreaker::Constants::MAX_DIGIT, CodeBreaker::Constants::MIN_DIGIT
      input.each do |digit|
        return false unless (min..max).cover?(digit)
      end
    end

    def self.validates_input?(input)
      raise ValidatorError, 'Input is nil' if input.nil?

      raise ValidatorError, 'Input is not instance of Integer' unless input.instance_of? Integer

      input = input.to_s
      max, min = CodeBreaker::Constants::MAX_DIGIT, CodeBreaker::Constants::MIN_DIGIT
      unless input.match(/^[1-6]{4}+$/)
        raise ValidatorError,
              "Input should consists of (#{min}-#{max}) digits and length #{CodeBreaker::Constants::MAX_LENGTH_CODE}"
      end

      true
    end
  end
end
