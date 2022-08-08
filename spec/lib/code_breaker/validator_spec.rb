RSpec.shared_examples 'not validates name' do
  it 'raise ValidatorError' do
    expect { CodeBreaker::Validator.validates_name?(name) }.to raise_error(CodeBreaker::ValidatorError, error_massage)
  end
end

RSpec.shared_examples 'validates name' do
  it 'validates' do
    expect(CodeBreaker::Validator.validates_name?(name)).to eq(result)
  end
end

RSpec.shared_examples 'validates input' do
  it 'validates' do
    expect(CodeBreaker::Validator.validates_input?(input)).to eq(result)
  end
end

RSpec.shared_examples 'not validates input' do
  it 'raise ValidatorError' do
    expect { CodeBreaker::Validator.validates_input?(input) }.to raise_error(CodeBreaker::ValidatorError, error_massage)
  end
end

RSpec.describe CodeBreaker::Validator do
  describe '#validates_name?' do
    context 'when name validates' do
      let(:name) { 'Vlad' }
      let(:result) { true }

      include_examples 'validates name'
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

  describe '#validates_input?' do
    context 'when input validates' do
      let(:input) { 1234 }
      let(:result) { true }

      include_examples 'validates input'
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
end
