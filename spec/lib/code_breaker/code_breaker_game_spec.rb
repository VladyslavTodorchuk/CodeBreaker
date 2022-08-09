RSpec.describe CodeBreaker::CodeBreakerGame do
  describe '#action' do
    let(:game) do
      described_class.new('Vlad', 'easy')
    end

    it 'raises NoMethodError wrong command' do
      expect { game.action(:wrong_command) }.to raise_error(CodeBreaker::NoCommandError, 'You entered wrong command')
    end

    it 'returns an Integer hint method' do
      expect(game.action(:hint)).to be_instance_of(Integer)
    end

    it 'returns a string guess method' do
      expect(game.action(:guess, 1234)).to be_instance_of(String)
    end

    it 'raises ValidatorError input is nil case for guess method' do
      expect { game.action(:guess) }.to raise_error(CodeBreaker::ValidatorError, 'Input is nil')
    end
  end
end
