FactoryBot.define do
  factory :user do
    name { "user" }
    email { "user@eaxmple.com" }
    password {"password"}
    password_confirmation {"password"}
  end
end
