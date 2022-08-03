RSpec.describe CodeBreaker::Game do
  let(:game) do
    described_class.new(name: 'Vlad', difficulty: 'easy', secret_code: [3, 4, 5, 6])
  end

  describe '#guess' do
    it 'should return ++++ win' do
      expect(game.guess(3456)).to eq('++++')
    end

    it 'should return ---- digits not in the same position' do
      expect(game.guess(6543)).to eq('----')
    end

    it 'should return " " no similarity' do
      expect(game.guess(1111)).to eq('')
    end

    it 'should raise ValidationError nil input' do
      expect { game.guess(nil) }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'should raise NoAttemptsError' do
      expect { 16.times { game.guess(1234) } }.to raise_error(CodeBreaker::NoAttemptsLeftError)
    end
  end

  describe '#receive_hint' do
    it 'should raise NoHintsLeftError' do
      expect { 3.times { game.receive_hint } }.to raise_error(CodeBreaker::NoHintsLeftError)
    end
  end
end
