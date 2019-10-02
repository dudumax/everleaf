# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'webdrivers'
require 'launchy'


RSpec.feature "Task management function", type: :feature  do
    
    background do
    FactoryBot.create(:task, title: 'Added name 1')
    FactoryBot.create(:task, title: 'Added name 2')
    FactoryBot.create(:second_task, title: 'Added name 3', content: 'Added content')
    end
  
  
  scenario "Test task list" do
    User.create!(name: 'user', email: 'user@example.com', password: 'password', password_confirmation: 'password')
    Task.create!(title: 'test_task_01', inquiry: 'testtesttest', deadline: DateTime )
    Task.create!(title: 'test_task_02', inquiry: 'samplesample', deadline: DateTime)
    visit tasks_path
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end
 
  

  scenario "Test task creation" do
    visit new_task_path
    fill_in "title", :with => "Added name 1"
    fill_in "inquiry", :with  => "added inquiry 1"
    fill_in "deadline", :with  => DateTime
    select "Not_started", :from => "status"
    select "high", :from => "priority"
    click_button  'Add a new Task'
    expect(page).to have_content("title", "inquiry", DateTime)
  end
  
  scenario "Test task details" do
    visit tasks_path
    expect(page).to have_content( 'Add a new Task')
  end
  
  scenario "Test whether tasks are arranged in descending order of creation date" do
   visit tasks_path
   click_link ('Sort by end date')
   expect(page).to have_content( "Status search", "Sort by end date")
  end
  
  scenario "Test status details" do
    visit tasks_path
    fill_in "title search", :with => "Added name 1"
    select "Completed", :from => "Status search"
    click_button 'Search'
    expect(page).to have_content( '@task.deadline: :asc')
  end
  
  scenario "Test priority details" do
   visit new_task_path
   fill_in "title", :with => "@task.title"
   fill_in "inquiry", :with  => "@task.inquiry"
   fill_in "deadline", :with => "DateTime"
   select "Not_started", :from => "status"
   select "high", :from => "priority"
   click_button 'Add a new Task'
   visit tasks_path
   click_link ('Sort by end date')
   expect(page).to have_content("title", "inquiry", "DateTime")
  end
  
  


end