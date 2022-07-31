
module CodeBreaker
  class Validator

    def self.validates_name?(name)
      return false if name.nil? && !name.instance_of?(String)
      name.length >= 3 && name.length <= 20 ? true : false
    end

    def self.check_1_to_6(input)
      input.each do |digit|
      return false unless digit <= 6 && digit >= 1
      end
    end

    private

    def self.validates_input?(input)
      return false unless input.instance_of? Integer
      input = input.to_s.chars.map(&:to_i)
      input.length == 4 && check_1_to_6(input) ? true : false
    end
  end
end