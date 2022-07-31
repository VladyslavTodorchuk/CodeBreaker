
RSpec.describe CodeBreaker::Validator do

  describe '#validates_name?' do
    example 'validates name' do
      expect(CodeBreaker::Validator.validates_name?('Vlad')).to eq(true)
      expect(CodeBreaker::Validator.validates_name?('Vladyslav')).to eq(true)
      expect(CodeBreaker::Validator.validates_name?('Bob')).to eq(true)
    end
    example 'no validates name to short' do
      expect(CodeBreaker::Validator.validates_name?('Vl')).to eq(false)
      expect(CodeBreaker::Validator.validates_name?('VladVladVladVladVladVlad')).to eq(false)
    end
    example 'nil check' do
      expect(CodeBreaker::Validator.validates_name?(nil)).to eq(false)
    end
    example 'no instance of String' do
      expect(CodeBreaker::Validator.validates_name?(1234)).to eq(false)
    end
  end

  describe '#validates_input?' do
    example 'validates inputs' do
      expect(CodeBreaker::Validator.validates_input?(1234)).to eq(true)
      expect(CodeBreaker::Validator.validates_input?(4563)).to eq(true)
      expect(CodeBreaker::Validator.validates_input?(3122)).to eq(true)
    end
    example 'digits not from 1 to 6' do
      expect(CodeBreaker::Validator.validates_input?(4578)).to eq(false)
      expect(CodeBreaker::Validator.validates_input?(4578)).to eq(false)
    end
    example 'input length is more then 4' do
      expect(CodeBreaker::Validator.validates_input?(12345)).to eq(false)
    end
    example 'nil check' do
      expect(CodeBreaker::Validator.validates_input?(nil)).to eq(false)
    end
    example 'no instance of Integer' do
      expect(CodeBreaker::Validator.validates_input?(' ')).to eq(false)
    end
  end



end