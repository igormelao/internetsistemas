require 'rails_helper'

RSpec.describe Course, type: :model do

  describe '#associations' do
    it do
      is_expected.to have_many(:classrooms)
        .inverse_of(:course)
        .dependent(:destroy)
    end

    it { is_expected.to have_many(:students).through(:classrooms) }
  end

  describe '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to validate_presence_of(:status) }
  end

end
