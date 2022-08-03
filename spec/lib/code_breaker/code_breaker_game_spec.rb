RSpec.describe CodeBreaker::CodeBreakerGame do
  describe '#start_game' do
    it 'should raise ValidatorError (to short)' do
      expect { described_class.new('Vl', 'easy') }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'should raise ValidatorError (to long)' do
      expect do
        described_class.new('VladVladVladVladVladVlad', 'easy')
      end.to raise_error(CodeBreaker::ValidatorError)
    end
  end

  describe '#action' do
    it 'should raise NoMethodError wrong command' do
      game = described_class.new('Vlad', 'easy')
      expect { game.action(:wrong_command) }.to raise_error(CodeBreaker::NoCommandError)
    end

    it 'should return an Integer hint method' do
      game = described_class.new('Vlad', 'easy')
      expect(game.action(:hint)).to be_instance_of(Integer)
    end

    it 'should check guess method. Return a String' do
      game = described_class.new('Vlad', 'easy')
      expect(game.action(:guess, 1234)).to be_instance_of(String)
    end

    it 'should raise TypeError input is nil case for guess method' do
      game = described_class.new('Vlad', 'easy')
      expect { game.action(:guess) }.to raise_error(CodeBreaker::ValidatorError)
    end
  end
end
