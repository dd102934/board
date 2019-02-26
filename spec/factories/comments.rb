# == Schema Information
#
# Table name: comments
#
#  id         :integer          not null, primary key
#  comment    :text             not null
#  name       :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#
# Indexes
#
#  index_comments_on_board_id  (board_id)
#

FactoryBot.define do
  factory :comment do
    name "Aaron"
    sequence(:comment) { |n| "coment#{n}" }
    association :board
  end
end
