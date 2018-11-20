# == Schema Information
#
# Table name: subs
#
#  id          :bigint(8)        not null, primary key
#  title       :string           not null
#  description :text             not null
#  mod_id      :integer          not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sub < ApplicationRecord
  validates :title, :description, presence: true
  
  belongs_to :moderator,
  foreign_key: :mod_id,
  class_name: :User,
  inverse_of: :subs
  
  has_many :post_subs,
  primary_key: :id,
  foreign_key: :sub_id,
  class_name: :PostSub,
  inverse_of: :sub

  has_many :posts,
    through: :post_subs,
    source: :post,
    inverse_of: :subs
  
end
