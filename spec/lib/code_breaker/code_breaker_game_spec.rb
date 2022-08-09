RSpec.describe CodeBreaker::CodeBreakerGame do
  let(:game) { described_class.new('Vlad', 'easy') }

  RSpec.shared_examples 'action method' do
    it 'return action method result' do
      expect(code).to be_a(result)
    end
  end

  RSpec.shared_examples 'action method raise error' do
    it 'raise error' do
      expect{ code }.to raise_error(error)
    end
  end

  describe '#start_game' do
    context 'when call generated code' do
      before {
        allow(CodeBreaker::CodeMaker).to receive(:generate_code)
        described_class.new('Vlad', 'easy')
      }

      it 'generate code' do
        expect(CodeBreaker::CodeMaker).to have_received(:generate_code)
      end
    end
  end

  describe '#action' do
    context 'when call CodeBreakerGame action with guess and input params' do
      let(:code) { game.action(:guess, 1234) }
      let(:result) { String }

      include_examples 'action method'
    end

    context 'when call CodeBreakerGame action with guess and input nil params' do
      let(:code) { game.action(:guess, nil) }
      let(:error) { 'Input is nil' }

      include_examples 'action method raise error'
    end

    context 'when call CodeBreakerGame action with undefined action' do
      let(:code) { game.action(:undefined) }
      let(:error) { 'You entered wrong command' }

      include_examples 'action method raise error'
    end

    context 'when call CodeBreakerGame action with hint param' do
      let(:code) { game.action(:hint) }
      let(:result) { Integer }

      include_examples 'action method'
    end
  end
end
