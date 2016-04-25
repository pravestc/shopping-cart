FactoryGirl.define do
  factory :user do
    sequence(:email) { |n| "test#{n}@example.com" }
    password "password"

    trait :shopkeeper do
      shopkeeper true
    end
  end
end
