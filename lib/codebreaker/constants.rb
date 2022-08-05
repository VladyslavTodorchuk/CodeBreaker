module CodeBreaker
  class Constants
    DIFFICULTY_HASH = { easy: { attempts: 15, hints: 2 },
                        medium: { attempts: 10, hints: 1 },
                        hell: { attempts: 5, hints: 1 } }.freeze
    MIN_NAME_LENGTH = 3
    MAX_NAME_LENGTH = 20

    MAX_LENGTH_CODE = 4

    MAX_DIGIT = 6
    MIN_DIGIT = 1
  end
end
