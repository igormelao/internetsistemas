class Student < ActiveRecord::Base

  # enums

  enum status: { inactive: 0, active: 1 }

  # validations

  validates :name, presence: true
  validates :register_number, presence: true

end
