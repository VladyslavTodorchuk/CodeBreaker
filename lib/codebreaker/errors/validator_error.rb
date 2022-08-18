module CodeBreaker
  class ValidatorError < StandardError
    def initialize(msg = 'Validation error')
      super
    end
  end
end
