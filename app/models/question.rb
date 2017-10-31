# == Schema Information
#
# Table name: questions
#
#  id          :integer          not null, primary key
#  title       :string
#  description :text
#  user_id     :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Question < ApplicationRecord
  extend FriendlyId
  friendly_id :title, use: :slugged

  acts_as_votable
  is_impressionable
  
  belongs_to :user
  has_many :comments, as: :commentable

  
  validates :title, presence: true
  validates :description, presence: true
  validates :user, presence: true

  def self.search(word: nil)
    with_word(word)
    .with_order
  end
  scope :with_word, proc { |word|
    if word.present?
      where("title like ?  OR description LIKE ? ", "%#{word}%", "%#{word}%")
    end
  }
  scope :with_order, -> { order('created_at DESC') }
  
end
