class Student < ActiveRecord::Base

  # enums

  has_enumeration_for :status, create_helpers: true

  # associations

  has_many :classrooms, dependent: :destroy

  # validations

  validates :name, presence: true
  validates :register_number, presence: true
  validates :status, presence: true

end
