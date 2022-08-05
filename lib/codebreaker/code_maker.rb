require_relative 'constants'

module CodeBreaker
  class CodeMaker
    def self.generate_code
      code = []
      CodeBreaker::Constants::MAX_LENGTH_CODE.times do
        code << rand(CodeBreaker::Constants::MIN_DIGIT..CodeBreaker::Constants::MAX_DIGIT)
      end
      code
    end
  end
end
