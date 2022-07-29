
RSpec.describe CodeBreaker::Game do
  it 'Test check_user_input method' do
    game = CodeBreaker::Game.new({name: "Vlad", difficulty: "Easy", total_attempts: 10, used_attempts: 0, total_hints: 5, used_hints: 0})
    expect('++--').to eq(game.check_user_input([6,5,4,3], [5,6,4,3]))
    expect('+-').to eq(game.check_user_input([6,5,4,3], [6,4,1,1]))
    expect('----').to eq(game.check_user_input([6,5,4,3], [3,4,5,6]))
    expect('+').to eq(game.check_user_input([6,5,4,3], [6, 6, 6, 6]))
    expect('-').to eq(game.check_user_input([6,5,4,3], [2,6,6,6]))
    expect('').to eq(game.check_user_input([6,5,4,3], [2,2,2,2]))
    expect('++++').to eq(game.check_user_input([6,5,4,3], [6,5,4,3]))
  end
end