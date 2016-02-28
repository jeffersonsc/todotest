require 'rails_helper'

feature 'Teste de Usuários' do

  let(:user) { create(:user) }

  scenario 'Lista isiários' do
    as_user(user).visit root_path

    expect(page).to have_content 'Usuários'
  end

end