RSpec.describe CodeBreaker::CodeBreakerGame do
  let(:game_obj) { described_class.new('Vlad', 'easy') }

  RSpec.shared_examples 'action method' do
    it 'return action method result' do
      expect(code).to be_a(result)
    end
  end

  RSpec.shared_examples 'action method raise error' do
    it 'raise error' do
      expect { code }.to raise_error(error)
    end
  end

  describe '#start_game' do
    context 'when call generated code' do
      before do
        allow(CodeBreaker::CodeMaker).to receive(:generate_code)
        described_class.new('Vlad', 'easy')
      end

      it 'generate code' do
        expect(CodeBreaker::CodeMaker).to have_received(:generate_code)
      end
    end
  end

  describe '#action' do
    let(:result) { described_class.new('Vlad', 'easy') }

    context 'when call guess with 1234 argument' do
      let(:game) { instance_double('CodeBreaker::Game') }

      before do
        allow(CodeBreaker::Game).to receive(:new) { game }
        allow(game).to receive(:guess).with(1234)
      end

      it do
        result.action(:guess, 1234)
        expect(game).to have_received(:guess).with(1234)
      end
    end

    context 'when call guess with nil argument' do
      let(:game) { instance_double('CodeBreaker::Game') }

      before do
        allow(CodeBreaker::Game).to receive(:new) { game }
        allow(game).to receive(:guess)
      end

      it do
        result.action(:guess)
        expect(game).to have_received(:guess)
      end
    end

    context 'when call hint' do
      let(:game) { instance_double('CodeBreaker::Game') }

      before do
        allow(CodeBreaker::Game).to receive(:new) { game }
        allow(game).to receive(:receive_hint)
      end

      it do
        result.action(:hint)
        expect(game).to have_received(:receive_hint)
      end
    end
  end
end
