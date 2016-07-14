class ClassroomsController < ApplicationController

  # constants

  PERMITTED_PARAMS = [
    :student_id,
    :course_id,
    :entry_at
  ]

  # exposures

  expose :classroom, attributes: :classroom_params

  def new
  end

  def create
    if classroom.save
      redirect_to courses_path(params[:course_id]), notice: flash_for_action_create_with_success
    else
      flash.now[:alert] = flash_for_action_create_with_error
      render :new
    end
  end

  def edit
  end

  def update
    if classroom.update(classroom_params)
      redirect_to courses_path(params[:course_id]), notice: flash_for_action_update_with_success
    else
      flash.now[:alert] = flash_for_action_update_with_error
      render :edit
    end
  end

  # private methods

  private

  def flash_for_action_create_with_success
    t('classroom.actions.create.notice')
  end

  def flash_for_action_create_with_error
    t('classroom.actions.create.alert')
  end

  def flash_for_action_update_with_success
    t('classroom.actions.update.notice')
  end

  def flash_for_action_update_with_error
    t('classroom.actions.update.alert')
  end

  def classroom_params
    params.require(:classroom).permit(PERMITTED_PARAMS)
  end

end
