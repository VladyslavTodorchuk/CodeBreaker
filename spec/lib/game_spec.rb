# frozen_string_literal: true

RSpec.describe CodeBreaker::Game do
  it 'Test check_user_input method' do
    game = described_class.new({ name: 'Vlad', difficulty: 'Easy', total_attempts: 10, used_attempts: 0,
                                 total_hints: 5, used_hints: 0 })
    expect(game.check_user_input([6, 5, 4, 3], [5, 6, 4, 3])).to eq('++--')
    expect(game.check_user_input([6, 5, 4, 3], [3, 4, 5, 6])).to eq('----')
    expect(game.check_user_input([6, 5, 4, 3], [6, 4, 1, 1])).to eq('+-')
    expect(game.check_user_input([6, 5, 4, 3], [6, 5, 4, 3])).to eq('++++')
  end
end
