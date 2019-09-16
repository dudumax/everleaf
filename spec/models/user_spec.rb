require 'rails_helper'

RSpec.describe User, type: :model do
 
  it  "Can register with name, email address and password" do
   user = User.new(name: 'taro', email: "taro@example.com", passward: "password")
   expect( user ).to  be_valid 
  end

  it  "Cannot register without a name" do
   user = User.new(name: '', email: 'taro@example.com', password: "password")
   expect(user).not_to be_valid
  
  end

  it  "Cannot register without email address" do
  user = User.new(name: 'taro', email: '', passward: "password")
  expect( user ).to  be_valid 
  end

  it  "Cannot register if email addresses are duplicated" do
    user= User.create(name: "taro" ,  email: "taro@example.com" ) 
    expect( user ).not_to  be_valid 
  end 

  it  "Cannot register without password" do
   user = User.new(name: 'taro', email: 'taro@example.com', password: '')
   expect(user).not_to be_valid 
  end 

it  "cannot save if password_confirmation and password are different"  do  
   user = User.new(name: 'taro', email: "taro@example.com", password: "password",password_confirmation: "passward")
    expect( user).not_to  be_valid  
  end 
  
  it  "password is encrypted"  do  
    user  =  FactoryBot.create ( :user ) 
    expect ( user.password_digest ). not_to  eq  "password" 
  end
  
  
 
   
  
  
end
