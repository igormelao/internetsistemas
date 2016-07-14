class StudentsController < ApplicationController

  # constants

  PERMITTED_PARAMS = [
    :name,
    :register_number,
    :status
  ]

  # exposures

  expose(:students) { all_students }
  expose :student, attributes: :student_params

  # actions

  def index
  end

  def new
  end

  def create
    if student.save
      redirect_to students_path, notice: flash_for_action_create_with_success
    else
      flash.now[:alert] = flash_for_action_create_with_error
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if student.update(student_params)
      redirect_to students_path, notice: flash_for_action_update_with_success
    else
      flash.now[:alert] = flash_for_action_update_with_error
      render :edit
    end
  end

  def destroy
    if student.destroy
      redirect_to students_path, notice: flash_for_action_destroy_with_success
    else
      redirect_to students_path, alert: flash_for_action_destroy_with_error
    end
  end

  # private methods

  private

  def flash_for_action_create_with_success
    ( t('flash.actions.create.notice') % { resource_name: student.try(:name) } )
  end

  def flash_for_action_create_with_error
    ( t('flash.actions.create.alert') % { resource_name: student.try(:name) } )
  end

  def flash_for_action_update_with_success
    ( t('flash.actions.update.notice') % { resource_name: student.try(:name) } )
  end

  def flash_for_action_update_with_error
    ( t('flash.actions.update.alert') % { resource_name: student.try(:name) } )
  end

  def flash_for_action_destroy_with_success
    ( t('flash.actions.destroy.notice') % { resource_name: student.try(:name) } )
  end

  def flash_for_action_destroy_with_error
    ( t('flash.actions.destroy.alert') % { resource_name: student.try(:name) } )
  end

  def student_params
    params.require(:student).permit(PERMITTED_PARAMS)
  end

  def all_students
    Student.all
  end

end
