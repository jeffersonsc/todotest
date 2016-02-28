require 'rails_helper'

RSpec.describe Todo, type: :model do
   describe 'Validação dos dados correto' do

    it 'Valida dados corretos' do
      expect(build(:todo)).to be_valid
    end

  end

  describe 'validação de dados não corretos' do

    it 'descrição em branco' do
      expect(build(:todo, description: nil)).not_to be_valid
    end

  end

end
