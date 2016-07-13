require 'rails_helper'

RSpec.describe Course, type: :model do

  describe '#validations' do
    it { is_expected.to validate_presence_of(:name) }
    it { is_expected.to validate_presence_of(:description) }
    it { is_expected.to define_enum_for(:status) }
  end

end
