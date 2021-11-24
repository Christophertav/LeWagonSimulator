class StudentsController < ApplicationController
  def update
    @student = Student.find(params[:id])
    helping_student = @student.current_buddy
    @student.is_helped = true
    @student.can_help = false
    helping_student.can_help = false
    if params['help'] == 'teacher'
      @student.teacher_help = true
      @student.success_probability += 40
    else 
      @student.success_probability += 20
      helping_student.success_probability = 0
    end
    @student.save
    helping_student.save
    redirect_to show_path(@show)
  end
end

