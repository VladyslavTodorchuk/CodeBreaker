module CodeBreaker
  class NoCommandError < StandardError
    def initialize(msg = 'You entered wrong command')
      super
    end
  end
end
