# == Schema Information
#
# Table name: compounds
#
#  id         :integer          not null, primary key
#  patient_id :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Compound < ApplicationRecord
  belongs_to :patient
  has_many :concentrations
  has_one :favorite_compound, :dependent => :destroy
  has_many :ingredients, :through => :concentrations, :source => :ingredient
end
