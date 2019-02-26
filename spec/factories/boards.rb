# == Schema Information
#
# Table name: boards
#
#  id         :integer          not null, primary key
#  body       :text
#  name       :string
#  title      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_boards_on_user_id  (user_id)
#

FactoryBot.define do
  factory :board do
    sequence(:title) { |n| "Board #{n}" }
    name "Aaron"
    body "Test body"
    association :user

    trait :with_comments do
      after(:create) { |board| create_list(:comment, 5, board: board) }
    end
 end    
end
