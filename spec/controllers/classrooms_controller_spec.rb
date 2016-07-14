require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do

  # let(:course)           { create(:course) }
  # let(:classrooms)       { create_list(:classroom, 2, course: course) }
  # let(:classroom)        { classroom.first }
  # let(:permitted_params) { [:student_id, :course_id, :entry_at] }
  # let(:error_msg)        { 'error message' }

  # describe '#new' do
  #   describe 'template' do
  #     render_views

  #     before { get :new }

  #     it { is_expected.to respond_with(:success) }
  #     it { is_expected.to render_template :new }
  #   end

  #   describe 'helper methods' do
  #     describe 'template' do
  #       render_views

  #       before { get :new }

  #       it { is_expected.to respond_with(:success) }
  #       it { is_expected.to render_template :new }
  #     end

  #     describe 'exposes' do
  #       it { expect(controller.classroom).to be_a_new(Classroom) }
  #     end
  #   end
  # end

  # describe '#create' do
  #   let(:valid_classroom_params)    { attributes_for(:classroom) }
  #   let(:invalid_classroom_params)  { attributes_for(:classroom, :invalid_classroom) }

  #   describe 'permitted params' do
  #     let(:params) { { classroom: valid_classroom_params } }

  #     it do
  #       is_expected.to permit(*permitted_params)
  #         .for(:create, params: params).on(:classroom)
  #     end

  #     context 'valid' do
  #       before { post :create, classroom: valid_classroom_params }

  #       let(:expected_flash) do
  #         I18n.t('classroom.actions.create.notice')
  #       end

  #       it { expect(controller).to set_flash[:notice].to(expected_flash) }
  #       it { expect(response).to redirect_to courses_path(valid_classroom_params[:course_id]) }
  #     end

  #     context 'invalid' do
  #       let(:expected_flash) do
  #         I18n.t('classroom.actions.create.alert')
  #       end

  #       before do
  #         allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
  #           .and_return([error_msg])
  #         post :create, classroom: invalid_classroom_params
  #       end

  #       it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
  #       it { expect(response).to render_template :new }
  #     end
  #   end
  # end
end
