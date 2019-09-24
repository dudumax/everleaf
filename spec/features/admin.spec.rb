require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'webdrivers'
require 'launchy'


Rspec.feature "User management function", type: :feature do
    background do
         FactoryBot.create(:user, name: 'user',email: "user@example.com", password: "password",password_confirmation: "password")
    end
    
    scenario "" do
    end
end