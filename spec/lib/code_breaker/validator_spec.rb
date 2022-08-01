RSpec.describe CodeBreaker::Validator do
  describe '#validates_name?' do
    it 'validates name' do
      expect(described_class.validates_name?('Vladyslav')).to eq(true)
    end

    it 'no validates name to short' do
      expect { described_class.validates_name?('Vl') }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'bo validaes naem to long' do
      expect { described_class.validates_name?('VladVladVladVladVladVlad') }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'nil check' do
      expect { described_class.validates_name?(nil) }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'no instance of String' do
      expect { described_class.validates_name?(1234) }.to raise_error(CodeBreaker::ValidatorError)
    end
  end

  describe '#validates_input?' do
    it 'validates inputs' do
      expect(described_class.validates_input?(1234)).to eq(true)
    end

    it 'digits not from 1 to 6' do
      expect { described_class.validates_input?(4578) }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'input length is more then 4' do
      expect { described_class.validates_input?(12_345) }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'nil check' do
      expect { described_class.validates_input?(nil) }.to raise_error(CodeBreaker::ValidatorError)
    end

    it 'no instance of Integer' do
      expect { described_class.validates_input?(' ') }.to raise_error(CodeBreaker::ValidatorError)
    end
  end
end
