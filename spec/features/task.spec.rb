# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'webdrivers'
require 'launchy'



RSpec.feature "Task management function", type: :feature do
  background do
    # Create two tasks in advance to use in the task list test
    FactoryBot.create(:task, title: 'Added name 1')
    FactoryBot.create(:task, title: 'Added name 2')
    FactoryBot.create(:second_task, title: 'Added name 3', inquiry: 'Added inquiry')
    Task.create!(title: 'test_task_01', inquiry: 'testtesttest')
    Task.create!(title: 'test_task_02', inquiry: 'mofmofmofmof')
  end
 
  scenario "Test task list" do
    Task.create!(title: 'test_task_01', inquiry: 'testtesttest')
    Task.create!(title: 'test_task_02', inquiry: 'samplesample')
    visit tasks_path
    save_and_open_page
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end
 
  

  scenario "Test task creation" do
    visit new_task_path
    fill_in "title", :with => "@task.title"
    fill_in "inquiry", :with  => "@task.inquiry"
    click_button  'Add a new Task'
    expect(page).to have_content("@task.title", "@task.inquiry")
  end
  
  scenario "Test task details" do
    visit task_path(Task.first)
    save_and_open_page
    expect(page).to have_content( 'Added name 1')
  end
  
  scenario "Test whether tasks are arranged in descending order of creation date" do
   visit tasks_path
   save_and_open_page
   click_button 'Sort by end date'
   expect(page).to have_content('date')
  end
  


end