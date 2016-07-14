class CoursesController < ApplicationController

  # constants

  PERMITTED_PARAMS = [
    :name,
    :description,
    :status
  ]

  # exposures

  expose(:courses) { all_courses }
  expose :course, attributes: :course_params

  # actions

  def index
  end

  def new
  end

  def create
    if course.save
      redirect_to courses_path, notice: flash_for_action_create_with_success
    else
      flash.now[:alert] = flash_for_action_create_with_error
      render :new
    end
  end

  def edit
  end

  def update
    if course.update(course_params)
      redirect_to courses_path, notice: flash_for_action_update_with_success
    else
      flash.now[:alert] = flash_for_action_update_with_error
      render :edit
    end
  end

  def destroy
    if course.destroy
      redirect_to courses_path, notice: flash_for_action_destroy_with_success
    else
      redirect_to courses_path, alert: flash_for_action_destroy_with_error
    end
  end

  # private methods

  private

  def flash_for_action_create_with_success
    ( t('flash.actions.create.notice') % { resource_name: course.try(:name) } )
  end

  def flash_for_action_create_with_error
    ( t('flash.actions.create.alert') % { resource_name: course.try(:name) } )
  end

  def flash_for_action_update_with_success
    ( t('flash.actions.update.notice') % { resource_name: course.try(:name) } )
  end

  def flash_for_action_update_with_error
    ( t('flash.actions.update.alert') % { resource_name: course.try(:name) } )
  end

  def flash_for_action_destroy_with_success
    ( t('flash.actions.destroy.notice') % { resource_name: course.try(:name) } )
  end

  def flash_for_action_destroy_with_error
    ( t('flash.actions.destroy.alert') % { resource_name: course.try(:name) } )
  end

  def course_params
    params.require(:course).permit(PERMITTED_PARAMS)
  end

  def all_courses
    Course.all
  end

end
