# == Schema Information
#
# Table name: ingredients
#
#  id         :integer          not null, primary key
#  name       :string
#  is_base    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Ingredient < ApplicationRecord
  has_many :concentrations, :dependent => :destroy
  has_many :compounds, :through => :concentrations, :source => :compound
  
  def concentration_for_compound(compound)
    self.concentrations.where(compound: compound).first
  end
  
end