RSpec.describe CodeBreaker::Game do
  let(:game) do
    described_class.new(name: 'Vlad', difficulty: 'easy', secret_code: [3, 4, 5, 6])
  end

  describe '#guess' do
    it 'victory' do
      expect(game.guess(3456)).to eq('++++')
    end

    it 'digits not in the same position' do
      expect(game.guess(6543)).to eq('----')
    end

    it 'no similarity' do
      expect(game.guess(1111)).to eq('')
    end

    it 'nil input' do
      expect { game.guess(nil) }.to raise_error(TypeError)
    end

    it 'NoAttemptsError check' do
      expect { 16.times { game.guess(1234) } }.to raise_error(CodeBreaker::NoAttemptsLeftError)
    end
  end

  describe '#receive_hint' do
    it 'NoHintsLeftError check' do
      expect { 3.times { game.receive_hint } }.to raise_error(CodeBreaker::NoHintsLeftError)
    end
  end
end
