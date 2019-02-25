FactoryBot.define do
  factory :comment do
    name "Aaron"
    sequence(:comment) { |n| "coment#{n}" }
  end
end
