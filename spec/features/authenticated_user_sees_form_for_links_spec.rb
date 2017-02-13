
require 'rails_helper'

RSpec.feature 'Authenticated User' do
  context 'logs into root page' do
    scenario 'sees a form to submit a link' do
      user = create :user, email: 'md', password: '123'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      expect(page).to have_content('Url')
      expect(page).to have_content('Title')
      expect(page).to have_content('Read')
    end
  end
end