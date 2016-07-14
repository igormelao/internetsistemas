require 'rails_helper'

RSpec.describe Classroom, type: :model do

  describe '#associations' do
    it { is_expected.to belong_to(:student).inverse_of(:classrooms) }
    it { is_expected.to belong_to(:course).inverse_of(:classrooms)  }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:entry_at) }
    it { is_expected.to validate_presence_of(:student) }
    it { is_expected.to validate_presence_of(:course) }

    it 'uniqueness student_id' do
      course          = create(:course)
      student         = create(:student)
      classroom       = create(:classroom, course: course, student: student)
      other_classroom = build(:classroom, course: course, student: student)

      expect{ other_classroom.save }.not_to change{ Classroom.count }
    end
  end

end
