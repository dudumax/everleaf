require 'rails_helper'


RSpec.describe Task, type: :model do
  it "Validation does not pass if the title is empty" do
    task = Task.new(title: '', inquiry: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    # Describe the contents here
    task = Task.new(title: 'Failure Test', inquiry: '')
    expect(task).not_to be_valid
    
  end

  it "validation passes If content is described in title and content" do
    # Describe the contents here
     task = Task.new(title: 'pass Test', inquiry: 'Pass Test')
    expect(task).to be_valid
    
  end
  
  it "validation does not passes If  status is empty" do
    # Describe the contents here
     task = Task.new(title: 'pass Test', inquiry: 'Pass Test', status: '')
    expect(task).to be_valid
    
  end
 
end
