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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :comment }
end
