module CodeBreaker
  class CodeMaker
    def self.generate_code
      code = []
      4.times { code << rand(1..6) }
      code
    end
  end
end
