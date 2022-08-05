RSpec.describe CodeBreaker::CodeBreakerGame do
  describe '#start_game' do
    it 'raises ValidatorError (too short)' do
      expect { described_class.new('Vl', 'easy') }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'raises ValidatorError (too long)' do
      expect do
        described_class.new('Va' * CodeBreaker::Constants::MAX_NAME_LENGTH, 'easy')
      end.to raise_error(CodeBreaker::ValidatorError)
    end
  end

  describe '#action' do
    let(:game) do
      described_class.new('Vlad', 'easy')
    end

    it 'raises NoMethodError wrong command' do
      expect { game.action(:wrong_command) }.to raise_error(CodeBreaker::NoCommandError)
    end

    it 'returns an Integer hint method' do
      expect(game.action(:hint)).to be_instance_of(Integer)
    end

    it 'checks guess method. Return a String' do
      expect(game.action(:guess, 1234)).to be_instance_of(String)
    end

    it 'raises TypeError input is nil case for guess method' do
      expect { game.action(:guess) }.to raise_error(CodeBreaker::ValidatorError)
    end
  end
end
