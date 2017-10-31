# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#

class Comment < ApplicationRecord
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :commentable,  class_name: "Comment" #-> requires "parent_id" column
  has_many   :replies, class_name: "Comment", foreign_key: :commentable_id, dependent: :destroy

  validates :body, presence: true  

end
