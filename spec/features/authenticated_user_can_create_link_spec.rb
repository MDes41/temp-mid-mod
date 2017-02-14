
require 'rails_helper'

RSpec.feature 'Authenticated User' do
  context 'logs into root page' do
    scenario 'sees a form to submit a link and submits a correct link' do
      user = create :user, email: 'md', password: '123'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      fill_in 'link[url]', with: 'http://www.example.com'
      fill_in 'link[title]', with: 'Example'
      click_on "Create Link"

      expect(page).to have_content('Url')
      expect(page).to have_content('Title')
      expect(page).to have_content('Read')
      expect(page).to have_content('www.example.com')
      expect(page).to have_content('Example')
    end

    scenario 'gets an error when submits an incorrect link' do
      user = create :user, email: 'md', password: '123'
      allow_any_instance_of(ApplicationController).to receive(:current_user).and_return(user)

      visit root_path

      fill_in 'link[url]', with: 'www.example.com'
      fill_in 'link[title]', with: 'Example'
      click_on "Create Link"

      expect(page).to have_content('Url')
      expect(page).to have_content('Title')
      expect(page).to have_content('Read')
      expect(page).to have_content('Url is not a valid url')
      expect(page).to_not have_content('Example')
      expect(page).to_not have_content('www.example.com')
    end

  end
end