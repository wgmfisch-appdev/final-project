# == Schema Information
#
# Table name: pharmacies
#
#  id              :integer          not null, primary key
#  address         :string
#  hours           :string
#  rating          :string
#  api_credentials :string
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class Pharmacy < ApplicationRecord
  has_many :users
end
