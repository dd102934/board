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

require 'rails_helper'

RSpec.describe Board, type: :model do
  it { is_expected.to validate_presence_of :name }
  it { is_expected.to validate_presence_of :title }
  it { is_expected.to validate_presence_of :body }
  

  it "can have many comments" do
    board = FactoryBot.create(:board, :with_comments)
    expect(board.comments.length).to eq 5
  end
end
