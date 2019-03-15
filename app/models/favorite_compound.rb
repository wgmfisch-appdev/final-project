# == Schema Information
#
# Table name: favorite_compounds
#
#  id           :integer          not null, primary key
#  favorited_by :integer
#  compound_id  :integer
#  created_at   :datetime         not null
#  updated_at   :datetime         not null
#

class FavoriteCompound < ApplicationRecord
  belongs_to :doctor, :class_name => "User", :foreign_key => "favorited_by"
  belongs_to :compound
end
