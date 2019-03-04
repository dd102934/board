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

class Board < ApplicationRecord
  has_many :comments, dependent: :delete_all 
  belongs_to :user
  has_many :board_tag_relations, dependent: :delete_all 
  has_many :tags, through: :board_tag_relations
  
  default_scope -> { order(created_at: :desc) }

  validates :name, presence: true, length: { maximum: 10 }
  validates :title, presence: true, length: { maximum: 30 }
  validates :body, presence: true, length: { maximum: 1000 }
end
