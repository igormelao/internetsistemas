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
    flash[:notice] = t('flash.actions.create.notice', resource_name: student.name) if student.save
    respond_with student, location: -> { students_path }
  end

  def show
  end

  def edit
  end

  def update
    if student.update(student_params)
      flash[:notice] = t('flash.actions.update.notice', resource_name: student.name)
    end
    respond_with student
  end

  def destroy
    if student.destroy
      flash[:notice] = t('flash.actions.destroy.notice', resource_name: student.name)
    end
    respond_with student, location: -> { students_path }
  end

  # private methods

  private

  def student_params
    params.require(:student).permit(PERMITTED_PARAMS)
  end

  def all_students
    Student.all
  end

end
