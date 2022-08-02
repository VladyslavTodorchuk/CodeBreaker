RSpec.describe CodeBreaker::CodeBreakerGame do
  describe '#start_game' do
    it 'ValidatorError (to short) check' do
      expect { described_class.new('Vl', 'easy') }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'ValidatorError (to long) check' do
      expect do
        described_class.new('VladVladVladVladVladVlad', 'easy')
      end.to raise_error(CodeBreaker::ValidatorError)
    end
  end

  describe '#action' do
    it 'NoMethodError check wrong parameter' do
      game = described_class.new('Vlad', 'easy')
      expect { game.action(:wrong_command) }.to raise_error(CodeBreaker::NoCommandError)
    end

    it 'Check hint method' do
      game = described_class.new('Vlad', 'easy')
      expect(game.action(:hint)).to be_instance_of(Integer)
    end

    it 'Check guess method' do
      game = described_class.new('Vlad', 'easy')
      expect(game.action(:guess, 1234)).to be_instance_of(String)
    end

    it 'TypeError input is nil case for guess method' do
      game = described_class.new('Vlad', 'easy')
      expect { game.action(:guess) }.to raise_error(CodeBreaker::ValidatorError)
    end
  end
end
