FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "Board #{n}" }
    name "Aaron"
    body "test body"
    user

    trait :with_comments do
      after(:create) { |board| create_list(:comment, 5, board: board) }
    end
 end    
end
