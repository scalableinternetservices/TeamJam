class JoinClassesController < ApplicationController
  def index
    @all_course = Course.all.where("end_date > ?", DateTime.now)
  end

  def join_courses
    params[:all_courses].each do |course, id|
      Enrollment.create(course_id: id.to_i, user_id: current_user.id, time_commitment: 2)
    end
    redirect_to root_path
  end

end
