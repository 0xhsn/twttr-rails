FactoryBot.define do
  factory :user do
    sequence(:email) { |n| "user#{n}@x.com" }
    password { 'ezpass' }
  end
end
