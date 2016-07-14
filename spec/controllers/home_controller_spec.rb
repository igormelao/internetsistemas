require 'rails_helper'

RSpec.describe HomeController, type: :controller do

  describe '#index' do
    before { get(:index) }

    describe 'template' do
      render_views
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :index }
    end
  end

end
