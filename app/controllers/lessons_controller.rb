class LessonsController < ApplicationController
  before_action :authenticate_user!
  before_action :ensure_enrolled

  def show
  end

  private

  helper_method :current_lesson
  def current_lesson
    @current_lesson ||= Lesson.find(params[:id])
  end

  def ensure_enrolled
    if current_user.enrolled_in?(current_lesson.section.course) == false
      redirect_to course_path(current_lesson.section.course), alert: 'Please enroll to see lessons'
    end
  end
end
