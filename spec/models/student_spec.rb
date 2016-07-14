require 'rails_helper'

RSpec.describe Student, type: :model do

  describe '#associations' do
    it do
      is_expected.to have_many(:classrooms)
      .inverse_of(:student)
      .dependent(:destroy)
    end

    it { is_expected.to have_many(:courses).through(:classrooms) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:register_number) }
    it { is_expected.to validate_presence_of(:status) }
    it { is_expected.to validate_uniqueness_of(:register_number) }
  end

end
