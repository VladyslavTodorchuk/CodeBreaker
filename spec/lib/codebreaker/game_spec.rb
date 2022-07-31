# frozen_string_literal: true

RSpec.describe CodeBreaker::Game do
  let(:game) do
    described_class.new(name: 'Vlad', difficulty: 'easy', secret_code: 3456)
  end


  describe '#check_user_input' do
    example 'valid data' do
      expect(game.check_user_input(3456)).to eq('++++')
      expect(game.check_user_input(6543)).to eq('----')
      expect(game.check_user_input(6523)).to eq('---')
    end
    example 'no similarity' do
      expect(game.check_user_input(1111)).to eq('')
      expect(game.check_user_input(2222)).to eq('')
    end
    example 'nil input' do
      expect(game.check_user_input(nil)).to eq('')
    end
  end



end
