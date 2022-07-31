RSpec.describe CodeBreaker::Game do
  let(:game) do
    described_class.new(name: 'Vlad', difficulty: 'easy', secret_code: 3456)
  end

  describe '#check_user_input' do
    example 'victory' do
      expect(game.guess(3456)).to eq('++++')
    end

    example 'digits not in the same position' do
      expect(game.guess(6543)).to eq('----')
    end

    example 'no similarity' do
      expect(game.guess(1111)).to eq('')
    end

    example 'nil input' do
      expect(game.guess(nil)).to eq('')
    end
  end
end
