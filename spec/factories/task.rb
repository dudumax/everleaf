FactoryBot.define do
  factory :task do
    title { "Added name 1" }
    inquiry { "added inquiry 1" }
    deadline {'2019.10.31'}
    status {0}
    priority {0}  
    user
  end
end
