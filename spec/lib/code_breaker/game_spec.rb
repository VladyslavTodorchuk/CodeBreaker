RSpec.shared_examples 'input result' do
  it 'return result' do
    expect(CodeBreaker::Game.new(name: 'Vlad', difficulty: 'easy', secret_code: secret_code).guess(code)).to eq(result)
  end
end

RSpec.shared_examples 'not validates input' do
  it 'raise ValidatorError' do
    expect do
      CodeBreaker::Game.new(name: 'Vlad', difficulty: 'easy').guess(code)
    end.to raise_error(CodeBreaker::ValidatorError, error_message)
  end
end

RSpec.describe CodeBreaker::Game do
  describe '#guess' do
    context 'when input is right' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '++++' }
      let(:code) { 3456 }

      include_examples 'input result'
    end

    context 'when input digit position is not right' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '----' }
      let(:code) { 6543 }

      include_examples 'input result'
    end

    context 'when input not right' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '' }
      let(:code) { 1111 }

      include_examples 'input result'
    end

    context 'when input is +-' do
      let(:secret_code) { [1, 2, 3, 4] }
      let(:result) { '+-' }
      let(:code) { 1356 }

      include_examples 'input result'
    end

    context 'when input is ++' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '++' }
      let(:code) { 1256 }

      include_examples 'input result'
    end

    context 'when input is --' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '--' }
      let(:code) { 1243 }

      include_examples 'input result'
    end

    context 'when input is ---' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '---' }
      let(:code) { 1643 }

      include_examples 'input result'
    end

    context 'when input is +++' do
      let(:secret_code) { [3, 4, 5, 6] }
      let(:result) { '+++' }
      let(:code) { 3451 }

      include_examples 'input result'
    end

    context 'when input is nil' do
      let(:error_message) { 'Input is nil' }
      let(:code) { nil }

      include_examples 'not validates input'
    end
  end

  describe '#receive_hint' do
    context 'when hint is giving right digits' do
      it 'check secret code include received hint' do
        tmp = []
        game = described_class.new name: 'Vlad', difficulty: 'hell', secret_code: CodeBreaker::CodeMaker.generate_code
        game.total_hints = 4
        4.times {tmp << game.receive_hint }
        expect(tmp).to match_array(game.secret_code)
      end
    end
  end

  describe 'error handling' do
    context 'when no attempts left' do
      it 'raise NoAttemptsLeftError' do
        game = described_class.new name: 'Vlad', difficulty: 'hell'
        game.total_attempts = 0
        expect { game.guess(123) }.to raise_error(CodeBreaker::NoAttemptsLeftError, 'You have no attempts left')
      end
    end

    context 'when no hints left' do
      it 'raise NoAttemptsLeftError' do
        game = described_class.new name: 'Vlad', difficulty: 'hell'
        game.total_hints = 0
        expect { game.receive_hint }.to raise_error(CodeBreaker::NoHintsLeftError, 'You have no hints left')
      end
    end
  end
end
