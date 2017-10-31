# == Schema Information
#
# Table name: comments
#
#  id               :integer          not null, primary key
#  commentable_type :string
#  commentable_id   :integer
#  created_at       :datetime         not null
#  updated_at       :datetime         not null
#  user_id          :integer
#  body             :string
#

class Comment < ApplicationRecord
  acts_as_votable  
  
  belongs_to :commentable, polymorphic: true
  belongs_to :user
  belongs_to :commentable,  class_name: "Comment" #-> requires "parent_id" column
  has_many   :replies, class_name: "Comment", foreign_key: :commentable_id, dependent: :destroy

  validates :body, presence: true  
  validates :user, presence: true  
end
