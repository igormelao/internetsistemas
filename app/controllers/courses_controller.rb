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
    flash[:notice] = t('flash.actions.create.notice', resource_name: course.name) if course.save
    respond_with course, location: -> { courses_path }
  end

  def edit
  end

  def update
    if course.update(course_params)
      flash[:notice] = t('flash.actions.update.notice', resource_name: course.name)
    end
    respond_with course
  end

  def destroy
    if course.destroy
      flash[:notice] = t('flash.actions.destroy.notice', resource_name: course.name)
    end
    respond_with course, location: -> { courses_path }
  end

  # private methods

  private

  def course_params
    params.require(:course).permit(PERMITTED_PARAMS)
  end

  def all_courses
    Course.all
  end

end
