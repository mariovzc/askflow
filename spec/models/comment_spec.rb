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

require 'rails_helper'

RSpec.describe Comment, type: :model do
  pending "add some examples to (or delete) #{__FILE__}"
end
