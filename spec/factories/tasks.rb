FactoryBot.define do
  factory :task do
    title { "MyString" }
    inquiry { "MyString" }
  end
  
  factory :second_task, class: Task do
    title { "MyString" }
    inquiry { "MyString"}
  end
end
