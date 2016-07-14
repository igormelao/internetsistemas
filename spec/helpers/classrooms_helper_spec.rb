require 'rails_helper'

RSpec.describe ClassroomsHelper, type: :helper do

  describe '#students_map' do
    let!(:students) { create_list(:student, 2) }
    let(:expected_result) do
      [
        [students.first.name, students.first.id],
        [students.second.name, students.second.id]
      ]
    end

    it 'returns a students map' do
      expect(students_map).to match_array(expected_result)
    end
  end

  describe '#courses_map' do
    let!(:courses) { create_list(:course, 2) }
    let(:expected_result) do
      [
        [courses.first.name, courses.first.id],
        [courses.second.name, courses.second.id]
      ]
    end

    it 'returns a courses map' do
      expect(courses_map).to match_array(expected_result)
    end
  end

end
