class Student < ActiveRecord::Base

  # enums

  has_enumeration_for :status, create_helpers: true

  # associations

  has_many :classrooms,
           inverse_of: :student,
           dependent: :destroy

  has_many :courses, through: :classrooms

  # validations

  validates :name, presence: true
  validates :register_number, presence: true
  validates :status, presence: true

end
