module CodeBreaker
  class NoAttemptsLeftError < StandardError
    def initialize(msg = 'You have no attempts left')
      super
    end
  end
end
