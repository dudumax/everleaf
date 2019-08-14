# In this require, the feature required for Feature Spec such as Capybara are available.
require 'rails_helper'



RSpec.feature "Task management function", type: :feature do
 
  scenario "Test task list" do
    Task.create!(title: 'test_task_01', inquiry: 'testtesttest')
    Task.create!(title: 'test_task_02', inquiry: 'samplesample')
    visit tasks_path
    save_and_open_page
    expect(page).to have_content 'testtesttest'
    expect(page).to have_content 'samplesample'
  end
 
  

  scenario "Test task creation" do
    visit  new_task_path
    fill_in "title", :with => @task.title
    fill_in "inquiry", :with  => @task.inquiry
    click_button  'Register'
    expect(page).to have_content("#{@task.title}: #{@task.inquiry}")
  end
  



  scenario "Test task details" do

  end

end