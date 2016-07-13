class Course < ActiveRecord::Base

  # enums

  enum status: { inactive: 0, active: 1 }

  # associations

  has_many :classrooms, dependent: :destroy

  # validations

  validates :name, presence: true
  validates :description, presence: true

end
