require 'rails_helper'

RSpec.describe Classroom, type: :model do

  describe '#associations' do
    it { is_expected.to belong_to(:student) }
    it { is_expected.to belong_to(:course)  }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:entry_at) }
  end

end
