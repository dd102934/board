# == Schema Information
#
# Table name: board_tag_relations
#
#  id         :integer          not null, primary key
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  board_id   :integer
#  tag_id     :integer
#
# Indexes
#
#  index_board_tag_relations_on_board_id  (board_id)
#  index_board_tag_relations_on_tag_id    (tag_id)
#

FactoryBot.define do
  factory :board_tag_relation do
    board nil
    tag nil
  end
end
