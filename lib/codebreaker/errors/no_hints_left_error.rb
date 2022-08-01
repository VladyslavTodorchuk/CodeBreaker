module CodeBreaker
  class NoHintsLeftError < StandardError
    def initialize(msg = 'You have no hints left')
      super
    end
  end
end
