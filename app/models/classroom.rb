class Classroom < ActiveRecord::Base

  # associations

  belongs_to :student
  belongs_to :course

  # validations

  validates :entry_at, presence: true
end
