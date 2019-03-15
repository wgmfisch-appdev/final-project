# == Schema Information
#
# Table name: concentrations
#
#  id                       :integer          not null, primary key
#  compound_id              :integer
#  ingredient_concentration :float
#  ingredient_id            :integer
#  created_at               :datetime         not null
#  updated_at               :datetime         not null
#

class Concentration < ApplicationRecord
  belongs_to :compound
  belongs_to :ingredient
end
