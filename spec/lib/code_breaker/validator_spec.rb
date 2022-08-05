RSpec.describe CodeBreaker::Validator do
  describe '#validates_name?' do
    let(:max) do
      CodeBreaker::Constants::MAX_NAME_LENGTH
    end

    let(:min) do
      CodeBreaker::Constants::MIN_NAME_LENGTH
    end

    it 'validateses name' do
      expect(described_class.validates_name?('Vladyslav')).to eq(true)
    end

    it 'raises ValidationError no validates name to short' do
      expect { described_class.validates_name?('Vl') }.to raise_error("Name length less then #{min} high then #{max}")
    end

    it 'raises ValidationError not validates name to long' do
      expect do
        described_class.validates_name?('Vl' * CodeBreaker::Constants::MAX_NAME_LENGTH)
      end.to raise_error("Name length less then #{min} high then #{max}")
    end

    it 'raises ValidationError nil check' do
      expect { described_class.validates_name?(nil) }.to raise_error('Name is nil')
    end

    it 'raises ValidationError no instance of String' do
      expect { described_class.validates_name?(1234) }.to raise_error('Name is not instance of String')
    end
  end

  describe '#validates_input?' do
    let(:max_code) do
      CodeBreaker::Constants::MAX_LENGTH_CODE
    end

    let(:min_digit) do
      CodeBreaker::Constants::MIN_DIGIT
    end

    let(:max_digit) do
      CodeBreaker::Constants::MAX_DIGIT
    end

    it 'validates inputs' do
      expect(described_class.validates_input?(1234)).to eq(true)
    end

    it 'raises ValidationError digits not from 1 to 6' do
      expect do
        described_class.validates_input?(4578)
      end.to raise_error("Input should consists of (#{min_digit}-#{max_digit}) digits and length #{max_code}")
    end

    it 'raises ValidationError input length is more then 4' do
      expect do
        described_class.validates_input?(12_345)
      end.to raise_error("Input should consists of (#{min_digit}-#{max_digit}) digits and length #{max_code}")
    end

    it 'raises ValidationError nil check' do
      expect { described_class.validates_input?(nil) }.to raise_error('Input is nil')
    end

    it 'raises ValidationError no instance of Integer' do
      expect { described_class.validates_input?(' ') }.to raise_error('Input is not instance of Integer')
    end
  end
end
