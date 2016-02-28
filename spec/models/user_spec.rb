require 'rails_helper'

RSpec.describe User, type: :model do
  describe 'Atributos válidos' do

    it 'verifica a validação do usuário' do
      expect(build(:user)).to be_valid
    end

  end

  describe 'Verifica inválidos' do

    it 'Primeiro nome' do
      expect(build(:user, first_name: nil)).not_to be_valid
    end

    it 'Segundo nome' do
      expect(build(:user, last_name: nil)).not_to be_valid
    end

    it 'Username/apelido' do
      expect(build(:user, username: nil)).not_to be_valid
    end

    it 'Email' do
      expect(build(:user, email: nil)).not_to be_valid
    end

    it 'Data de aniversário' do
      expect(build(:user, birth_date: nil)).not_to be_valid
    end
  end
end
