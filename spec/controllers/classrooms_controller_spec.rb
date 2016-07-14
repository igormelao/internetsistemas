require 'rails_helper'

RSpec.describe ClassroomsController, type: :controller do

  let(:course)           { create(:course) }
  let(:classrooms)       { create_list(:classroom, 2, course: course) }
  let(:classroom)        { classroom.first }
  let(:permitted_params) { [:student_id, :course_id, :entry_at] }
  let(:error_msg)        { 'error message' }

  describe '#new' do
    describe 'template' do
      render_views

      before { get :new }

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :new }
    end

    describe 'helper methods' do
      describe 'template' do
        render_views

        before { get :new }

        it { is_expected.to respond_with(:success) }
        it { is_expected.to render_template :new }
      end

      describe 'exposes' do
        it { expect(controller.classroom).to be_a_new(Classroom) }
      end
    end
  end

  describe '#create' do
    let(:valid_classroom_params)    { attributes_for(:classroom) }
    let(:invalid_classroom_params)  { attributes_for(:classroom, :invalid_classroom) }

    describe 'permitted params' do
      let(:params) { { classroom: valid_classroom_params } }

      it do
        is_expected.to permit(*permitted_params)
          .for(:create, params: params).on(:classroom)
      end

      context 'valid' do
        before { post :create, classroom: valid_classroom_params }

        let(:expected_flash) do
          I18n.t('classroom.actions.create.notice')
        end

        it { expect(controller).to set_flash[:notice].to(expected_flash) }
        it { expect(response).to redirect_to courses_path(valid_classroom_params[:course_id]) }
      end

      context 'invalid' do
        let(:expected_flash) do
          I18n.t('classroom.actions.create.alert')
        end

        before do
          allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
            .and_return([error_msg])
          post :create, classroom: invalid_classroom_params
        end

        it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
        it { expect(response).to render_template :new }
      end
    end
  end

  describe '#edit' do
    # describe 'template' do
    #   render_views

    #   before { get(:edit, id: classroom) }

    #   it { is_expected.to respond_with :success }
    #   it { is_expected.to render_template :edit }
    # end

    # describe 'helper methods' do
    #   before { get :edit, id: classroom }

    #   describe 'exposes' do
    #     it { expect(controller.classroom).to eq(classroom) }
    #   end
    # end
  end

  describe '#update' do
    # let!(:valid_classroom) { classroom }
    # let(:valid_classroom_attributes) do
    #   valid_classroom.attributes
    # end
    # let(:invalid_classroom) do
    #   classroom = create(:classroom, course: course)
    #   classroom.entry_at = nil
    #   classroom
    # end
    # let(:invalid_classroom_attributes) { invalid_classroom.attributes }

    # let(:valid_classroom_params) do
    #   { id: classroom, classroom: valid_classroom_attributes }
    # end

    # let(:invalid_classroom_params) do
    #   { id: invalid_classroom, classroom: invalid_classroom_attributes }
    # end

    describe 'params' do
      # it do
      #   is_expected.to permit(*permitted_params)
      #     .for(:update, params: valid_classroom_params)
      # end

      # context 'valid' do
      #   before { patch :update, valid_classroom_params }

      #   let(:expected_flash) do
      #     I18n.t('classroom.actions.update.notice')
      #   end

      #   it { expect(response).to redirect_to courses_path(valid_classroom_params[:course_id]) }
      #   it { expect(controller).to set_flash[:notice].to(expected_flash) }
      # end

      # context 'invalid' do
      #   let(:expected_flash) do
      #     I18n.t('classroom.actions.update.alert')
      #   end

      #   before do
      #     allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
      #       .and_return([error_msg])
      #     patch :update, invalid_classroom_params
      #   end

      #   it { expect(response).to render_template :edit }
      #   it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
      # end
    end
  end
end
