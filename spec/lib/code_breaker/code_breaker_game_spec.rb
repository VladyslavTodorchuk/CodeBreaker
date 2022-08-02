RSpec.describe CodeBreaker::CodeBreakerGame do
  let(:game) do
    described_class.new
  end

  describe '#start_game' do
    it 'ValidatorError (to short) check' do
      expect { game.start_game('Vl', 'easy') }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'ValidatorError (to long) check' do
      expect { game.start_game('VladVladVladVladVladVlad', 'easy') }.to raise_error(CodeBreaker::ValidatorError)
    end
  end

  describe '#action' do
    it 'NoMethodError check wrong parameter' do
      game.start_game('Vlad', 'easy')
      expect { game.action(:wrong_command) }.to raise_error(NoMethodError)
    end

    it 'Check hint method' do
      game.start_game('Vlad', 'easy')
      expect(game.action(:hint)).to be_instance_of(Integer)
    end

    it 'Check guess method' do
      game.start_game('Vlad', 'easy')
      expect(game.action(:guess, 1234)).to be_instance_of(String)
    end

    it 'TypeError input is nil case for guess method' do
      game.start_game('Vlad', 'easy')
      expect { game.action(:guess) }.to raise_error(TypeError)
    end
  end
end
