require 'rails_helper'


RSpec.describe Task, type: :model do
  
   before do
    @user = User.create(name: 'name', email: "email@email.email", password: 'password', password_confirmation: 'password')
  end
  
  it "Validation does not pass if the title is empty" do
    task = Task.new(title: '', inquiry: 'Failure test')
    expect(task).not_to be_valid
  end

  it "Validation does not pass if content is empty" do
    # Describe the contents here
    task = Task.new(title: 'Failure Test', inquiry: '')
    expect(task).not_to be_valid
    
  end

  it "validation do not passes If status and priority is not  described " do
    # Describe the contents here
     task = Task.new(title: 'Pass Test', inquiry: 'Pass Test',deadline: DateTime, status: "Not_started",priority: '')
    expect(task).not_to be_valid
    
  end
  
  it "validation does not passes If  status is empty" do
    # Describe the contents here
     task = Task.new(title: 'pass Test', inquiry: 'Pass Test', status: '')
    expect(task).not_to be_valid
    
  end
  
 
end
