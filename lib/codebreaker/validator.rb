require_relative './errors/validator_error'

module CodeBreaker
  class Validator
    def self.validates_name?(name)
      raise ValidatorError, 'Name is nil' if name.nil?

      raise ValidatorError, 'Name is not instance of String' unless name.instance_of?(String)

      raise ValidatorError, 'Name length less then 3 high then 20' unless name.length >= 3 &&
                                                                          name.length <= 20

      true
    end

    def self.check_digits(input)
      input.each do |digit|
        return false unless digit <= 6 && digit >= 1
      end
    end

    def self.validates_input?(input)
      raise ValidatorError, 'Input is nil' if input.nil?

      raise ValidatorError, 'Input is not instance of Integer' unless input.instance_of? Integer

      input = input.to_s.chars.map(&:to_i)
      raise ValidatorError, 'Input should consists of (1-6) digits' unless input.length == 4 &&
                                                                           check_digits(input)

      true
    end
  end
end
