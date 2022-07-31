RSpec.describe CodeBreaker::Validator do
  describe '#validates_name?' do
    example 'validates name' do
      expect(described_class.validates_name?('Vladyslav')).to eq(true)
    end

    example 'no validates name to short' do
      expect(described_class.validates_name?('Vl')).to eq(false)
    end

    example 'bo validaes naem to long' do
      expect(described_class.validates_name?('VladVladVladVladVladVlad')).to eq(false)
    end

    example 'nil check' do
      expect(described_class.validates_name?(nil)).to eq(false)
    end

    example 'no instance of String' do
      expect(described_class.validates_name?(1234)).to eq(false)
    end
  end

  describe '#validates_input?' do
    example 'validates inputs' do
      expect(described_class.validates_input?(1234)).to eq(true)
    end

    example 'digits not from 1 to 6' do
      expect(described_class.validates_input?(4578)).to eq(false)
    end

    example 'input length is more then 4' do
      expect(described_class.validates_input?(12_345)).to eq(false)
    end

    example 'nil check' do
      expect(described_class.validates_input?(nil)).to eq(false)
    end

    example 'no instance of Integer' do
      expect(described_class.validates_input?(' ')).to eq(false)
    end
  end
end
