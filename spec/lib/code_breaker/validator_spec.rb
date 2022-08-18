RSpec.describe CodeBreaker::Validator do
  shared_examples 'not validates name' do
    it 'raise ValidatorError' do
      expect { described_class.validates_name(name) }.to raise_error(CodeBreaker::ValidatorError, error_massage)
    end
  end

  shared_examples 'not validates input' do
    it 'raise ValidatorError' do
      expect do
        described_class.validates_input(input)
      end.to raise_error(CodeBreaker::ValidatorError, error_massage)
    end
  end

  shared_examples 'not validates difficulty' do
    it 'raise ValidatorError' do
      expect do
        described_class.validates_difficulty(input)
      end.to raise_error(CodeBreaker::ValidatorError, error_massage)
    end
  end

  describe '#validates_name' do
    context 'when name validates' do
      it 'name validates' do
        expect(described_class.validates_name('Vlad')).to eq(nil)
      end
    end

    context 'when too short name' do
      let(:name) { 'a' * CodeBreaker::Constants::MIN_NAME_LENGTH.pred }
      let(:error_massage) { 'Name length must be between 3 and 20 chars' }

      include_examples 'not validates name'
    end

    context 'when too long name' do
      let(:name) { 'a' * CodeBreaker::Constants::MAX_NAME_LENGTH.next }
      let(:error_massage) { 'Name length must be between 3 and 20 chars' }

      include_examples 'not validates name'
    end

    context 'when is instance of String' do
      let(:name) { 1234 }
      let(:error_massage) { 'Name is not instance of String' }

      include_examples 'not validates name'
    end
  end

  describe '#validates_input' do
    context 'when input validates' do
      it 'validates' do
        expect(described_class.validates_input(1234)).to eq(nil)
      end
    end

    context 'when use digits not in range of 1-6' do
      let(:input) { 4578 }
      let(:error_massage) { 'Input should consists of (1-6) digits and length 4' }

      include_examples 'not validates input'
    end

    context 'when long code' do
      let(:input) { 12_345 }
      let(:error_massage) { 'Input should consists of (1-6) digits and length 4' }

      include_examples 'not validates input'
    end

    context 'when nil passing' do
      let(:input) { nil }
      let(:error_massage) { 'Input is nil' }

      include_examples 'not validates input'
    end

    context 'when string passing' do
      let(:input) { ' ' }
      let(:error_massage) { 'Input is not instance of Integer' }

      include_examples 'not validates input'
    end
  end

  describe '#validates_difficulty' do
    context 'when difficulty validates' do
      it 'validates' do
        expect(described_class.validates_difficulty('easy')).to eq(nil)
      end
    end

    context 'when difficulty not validates' do
      let(:input) { 1234 }
      let(:error_massage) { 'Difficulty is not instance of String' }

      include_examples 'not validates difficulty'
    end

    context 'when difficulty not validates, wrong_difficulty' do
      let(:input) { 'wrong_difficulty' }
      let(:error_massage) { 'There no such difficulty' }

      include_examples 'not validates difficulty'
    end

    context 'when difficulty not validates nil' do
      let(:input) { nil }
      let(:error_massage) { 'Difficulty is nil' }

      include_examples 'not validates difficulty'
    end
  end
end
