class ClassroomsController < ApplicationController

  # constants

  PERMITTED_PARAMS = [
    :student_id,
    :course_id,
    :entry_at
  ]

  # exposures

  expose :classroom, attributes: :classroom_params

  def index
    redirect_to new_classroom_path
  end

  def new
  end

  def create
    if classroom.save
      flash[:notice] = t('flash.actions.create.notice', resource_name: t('classroom'))
    end
    respond_with classroom, location: -> { courses_path }
  end

  # private methods

  private

  def classroom_params
    params.require(:classroom).permit(PERMITTED_PARAMS)
  end

end
