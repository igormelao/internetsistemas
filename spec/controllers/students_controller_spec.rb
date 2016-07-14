require 'rails_helper'

RSpec.describe StudentsController, type: :controller do

  let(:students)         { create_list(:student, 2) }
  let(:student)          { students.first }
  let(:permitted_params) { [:name, :register_number, :status] }
  let(:error_msg)        { 'error message' }

  describe '#index' do
    describe 'template' do
      render_views
      before { get(:index) }

      it { is_expected.to respond_with(:success) }
      it { is_expected.to render_template :index }
    end

    describe 'exposes' do
      it { expect(controller.students).to eq students }
    end
  end

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
        it { expect(controller.student).to be_a_new(Student) }
      end
    end
  end

  describe '#create' do
    let(:valid_student_params)    { attributes_for(:student) }
    let(:invalid_student_params)  { attributes_for(:student, :invalid) }

    describe 'permitted params' do
      let(:params) { { student: valid_student_params } }

      it do
        is_expected.to permit(*permitted_params)
          .for(:create, params: params).on(:student)
      end

      context 'valid' do
        before { post :create, student: valid_student_params }

        let(:expected_flash) do
          I18n.t('flash.actions.create.notice') %
          { resource_name: valid_student_params[:name] }
        end

        it { expect(controller).to set_flash[:notice].to(expected_flash) }
        it { expect(response).to redirect_to action: :index }
      end

      context 'invalid' do
        let(:expected_flash) do
          I18n.t('flash.actions.create.alert') %
          { resource_name: invalid_student_params[:name] }
        end

        before do
          allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
            .and_return([error_msg])
          post :create, student: invalid_student_params
        end

        it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
        it { expect(response).to render_template :new }
      end
    end
  end

  describe '#edit' do
    describe 'template' do
      render_views

      before { get(:edit, id: student) }

      it { is_expected.to respond_with :success }
      it { is_expected.to render_template :edit }
    end

    describe 'helper methods' do
      before { get :edit, id: student }

      describe 'exposes' do
        it { expect(controller.student).to eq(student) }
      end
    end
  end

  describe '#update' do
    let!(:valid_student)              { student }
    let(:invalid_student_attributes) do
      invalid_student.attributes.merge!(status: :active)
    end

    let(:valid_student_attributes) do
      valid_student.attributes.merge!(status: :active)
    end

    let(:invalid_student) do
      student = create(:student)
      student.name = nil
      student
    end

    let(:valid_student_params) do
      { id: student, student: valid_student_attributes }
    end

    let(:invalid_student_params) do
      { id: invalid_student, student: invalid_student_attributes }
    end

    describe 'params' do
      it do
        is_expected.to permit(*permitted_params)
          .for(:update, params: valid_student_params)
      end

      context 'valid' do
        before { patch :update, valid_student_params }

        let(:expected_flash) do
          I18n.t('flash.actions.update.notice') %
            { resource_name: valid_student.name }
        end

        it { expect(response).to redirect_to action: :index }
        it { expect(controller).to set_flash[:notice].to(expected_flash) }
      end

      context 'invalid' do
        let(:expected_flash) do
          I18n.t('flash.actions.update.alert') %
            { resource_name: invalid_student.name }
        end

        before do
          allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
            .and_return([error_msg])
          patch :update, invalid_student_params
        end

        it { expect(response).to render_template :edit }
        it { expect(controller).to set_flash.now[:alert].to(expected_flash) }
      end
    end
  end

  describe '#destroy' do
    context 'on success' do
      let(:expected_flash) do
        I18n.t('flash.actions.destroy.notice') % { resource_name: student.name }
      end

      before { delete :destroy, id: student }

      it { expect(response).to redirect_to action: :index }
      it { expect(controller).to set_flash[:notice].to(expected_flash) }
    end

    context 'on failure' do
      let(:expected_flash) do
        I18n.t('flash.actions.destroy.alert') %
          { resource_name: student.name }
      end

      before do
        allow_any_instance_of(Student).to receive(:destroy).and_return(false)
        allow_any_instance_of(ActiveModel::Errors).to receive(:full_messages)
          .and_return([error_msg])
        delete :destroy, id: student
      end

      it { expect(response).to redirect_to action: :index }
      it { expect(controller).to set_flash[:alert].to(expected_flash) }
    end
  end
end
