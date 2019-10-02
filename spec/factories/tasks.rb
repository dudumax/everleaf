FactoryBot.define do
  factory :task do
    user
    title { "Added name 1" }
    inquiry { "added inquiry 1" }
    deadline {DateTime}
    status {0}
    priority {0}  
  end
end
