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

  # In the input field labeled "Task Name" and in the input field labeled "Task Details"
  # Fill in the task title and content respectively
  user.name="anything"
  user.email= "anything"
  task.title= "anything"
  task.inquiry = "anything"
  # 2.Write the process to fill_in (input) the contents in the input field of label name "task name" here
  # 3.Write the process to fill_in (input) the contents in the input column of the label name "task details" here

  # Click_on a button with a value (notation letter) of “Register”
  # 4.Write a process to click_on (click) a button with a value (notation letter) of “Register”

  # Check if the information that is supposed to be registered by click is displayed on the task detail page
  # (Assumption that transition to the task details screen will be made if the task is registered)
  # 5.On the task detail page, Write a code to check (expect) whether the data (description) that should have been created by the test code is have_content (included)
end
  end

  scenario "Test task details" do

  end
end