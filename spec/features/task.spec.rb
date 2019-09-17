# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'
require 'spec_helper'
require 'capybara/rails'
require 'webdrivers'
require 'launchy'


RSpec.feature "Task management function", type: :feature  do
  background do
    
    
    #create user
    FactoryBot.create(:user,name: "name",email: "email@email.email",password: "password",password_confirmation: "password")
    
    # Create two tasks in advance to use in the task list test
    FactoryBot.create(:task, title: 'Added name 1',inquiry: "added inquiry 1", deadline: DateTime, status: 0, priority: 1)
    FactoryBot.create(:task, title: 'Added name 2',inquiry: "added inquiry 2", deadline: DateTime, status: 1, priority: 1)
    FactoryBot.create(:second_task, title: 'Added name 3', inquiry: 'Added inquiry')
    Task.create!(title: 'test_task_01', inquiry: 'testtesttest')
    Task.create!(title: 'test_task_02', inquiry: 'mofmofmofmof')
  end
 
  scenario "Test task list" do
    login_as user
    Task.create!(title: 'test_task_01', inquiry: 'testtesttest', deadline: DateTime )
    Task.create!(title: 'test_task_02', inquiry: 'samplesample', deadline: DateTime)
    visit tasks_path
    save_and_open_page
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end
 
  

  scenario "Test task creation" do
     login_as user
    visit new_task_path
    fill_in "title", :with => "@task.title"
    fill_in "inquiry", :with  => "@task.inquiry"
    fill_in "deadline", :with  => "@task.deadline"
    page.select("@task.status", :form => "Status")
    page.select("@task.priority", :form => "Priority")
    click_button  'Add a new Task'
    expect(page).to have_content("@task.title", "@task.inquiry", "@task.deadline","@tasks.status")
  end
  
  scenario "Test task details" do
      login_as user
    visit task_path(Task.first)
    save_and_open_page
    expect(page).to have_content( 'Added name 1')
  end
  
  scenario "Test whether tasks are arranged in descending order of creation date" do
      login_as user
   visit tasks_path
   click_link ('Sort by end date')
   expect(page).to have_content("@task.title", "@task.inquiry")
  end
  
  scenario "Test status details" do
     login_as user
    visit task_path(Task.first)
    save_and_open_page
    fill_in "Title Search", :with => "@task.title"
    page.select("@task.status", :form => "Status search")
     click_button 'Search'
    expect(page).to have_content( '@task.deadline: :asc')
  end
  
  scenario "Test priority details" do
    login_as user
   visit new_task_path
   fill_in "title", :with => "@task.title"
   fill_in "inquiry", :with  => "@task.inquiry"
   fill_in "deadline", :with => "DateTime"
   page.select("@task.status", :form => "status")
   page.select("@task.priority", :form => "priority")
   click_button 'Add a new Task'
   visit tasks_path
   click_link ('Sort by end date')
   expect(page).to have_content("@task.title", "@task.inquiry")
  end
  
  


end