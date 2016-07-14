class Course < ActiveRecord::Base

  # enums

  has_enumeration_for :status, create_helpers: true

  # associations

  has_many :classrooms,
           inverse_of: :course,
           dependent: :destroy

  has_many :students, through: :classrooms

  # validations

  validates :name, presence: true
  validates :description, presence: true
  validates :status, presence: true

end
