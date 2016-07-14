class Course < ActiveRecord::Base

  # enums

  has_enumeration_for :status, create_helpers: true

  # associations

  has_many :classrooms, dependent: :destroy

  # validations

  validates :name, presence: true
  validates :description, presence: true

end
