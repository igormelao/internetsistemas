require 'rails_helper'

RSpec.describe CoursesController, type: :controller do

  let(:courses)          { create_list(:course, 2) }
  let(:course)           { courses.first }
  let(:classrooms)       { create_list(:classroom, course: course) }
  let(:permitted_params) { [:name, :description, :status] }
  let(:error_msg)        { 'error message' }

  describe '#index' do
    before { get(:index) }

    describe 'template' do
      render_views
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :index }
    end

    describe 'exposes' do
      it { expect(controller.courses).to eq courses }
    end
  end

  describe '#new' do
    before { get :new }

    describe 'template' do
      render_views
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :new }
    end

    describe 'exposes' do
      it { expect(controller.course).to be_a_new(Course) }
    end
  end

  describe '#create' do
    let(:valid_course_params)    { attributes_for(:course) }
    let(:invalid_course_params)  { attributes_for(:course, :course_invalid) }

    describe 'permitted params' do
      let(:params) { { course: valid_course_params } }

      it do
        is_expected.to permit(*permitted_params)
          .for(:create, params: params).on(:course)
      end

      context 'valid' do
        before { post :create, course: valid_course_params }

        let(:expected_flash) do
          I18n.t('flash.actions.create.notice') %
          { resource_name: valid_course_params[:name] }
        end

        it { expect(controller).to set_flash[:notice].to(expected_flash) }
        it { expect(response).to redirect_to action: :index }
      end

      context 'invalid' do
        let(:expected_flash) do
          I18n.t('flash.actions.create.alert') %
          { resource_name: invalid_course_params[:name] }
        end

        before do
          allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
            .and_return([error_msg])
          post :create, course: invalid_course_params
        end

        it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
        it { expect(response).to render_template :new }
      end
    end
  end

  describe '#show' do
    before { get :show, id: course }

    describe 'template' do
      render_views
      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :show }
    end

    describe 'exposes' do
      it { expect(controller.course).to eq(course) }
    end
  end

  describe '#edit' do
    before { get(:edit, id: course) }

    describe 'template' do
      render_views
      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :edit }
    end

    describe 'exposes' do
      it { expect(controller.course).to eq(course) }
    end
  end

  describe '#update' do
    let!(:valid_course)              { course }
    let(:invalid_course_attributes) do
      invalid_course.attributes.merge!(status: :active)
    end

    let(:valid_course_attributes) do
      valid_course.attributes.merge!(status: :active)
    end

    let(:invalid_course) do
      course = create(:course)
      course.name = nil
      course
    end

    let(:valid_course_params) do
      { id: course, course: valid_course_attributes }
    end

    let(:invalid_course_params) do
      { id: invalid_course, course: invalid_course_attributes }
    end

    describe 'params' do
      it do
        is_expected.to permit(*permitted_params)
          .for(:update, params: valid_course_params)
      end

      context 'valid' do
        before { patch :update, valid_course_params }

        let(:expected_flash) do
          I18n.t('flash.actions.update.notice') %
            { resource_name: valid_course.name }
        end

        it { expect(response).to redirect_to action: :index }
        it { expect(controller).to set_flash[:notice].to(expected_flash) }
      end

      context 'invalid' do
        let(:expected_flash) do
          I18n.t('flash.actions.update.alert') %
            { resource_name: invalid_course.name }
        end

        before do
          allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
            .and_return([error_msg])
          patch :update, invalid_course_params
        end

        it { expect(response).to render_template :edit }
        it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
      end
    end
  end

  describe '#destroy' do
    context 'on success' do
      let(:expected_flash) do
        I18n.t('flash.actions.destroy.notice') % { resource_name: course.name }
      end

      before { delete :destroy, id: course }

      it { expect(response).to redirect_to action: :index }
      it { expect(controller).to set_flash[:notice].to(expected_flash) }
    end

    context 'on failure' do
      let(:expected_flash) do
        I18n.t('flash.actions.destroy.alert') %
          { resource_name: course.name }
      end

      before do
        allow_any_instance_of(Course).to receive(:destroy).and_return(false)
        allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
          .and_return([error_msg])
        delete :destroy, id: course
      end

      it { expect(response).to redirect_to action: :index }
      it { expect(controller).to set_flash[:alert].to(expected_flash) }
    end
  end
end
