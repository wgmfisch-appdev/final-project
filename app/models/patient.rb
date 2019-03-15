# == Schema Information
#
# Table name: patients
#
#  id         :integer          not null, primary key
#  dob        :date
#  doctor_id  :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Patient < ApplicationRecord
  belongs_to :doctor, :class_name => "User"
  has_many :compounds
end
