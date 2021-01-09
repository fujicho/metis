class Teacher::StudentMembersController < Teacher::Base
  def index
    @student_members = StudentMember.order(id: "DESC").page(params[:page])
    @search_form = Teacher::StudentSearchForm.new
  end

  def show
    @student_member = StudentMember.find(params[:id])
  end

  def new
    @student_form = Teacher::StudentForm.new
  end
  
  def edit
    @student_form = Teacher::StudentForm.new(StudentMember.find(params[:id]))
  end

  def create
    @student_form = Teacher::StudentForm.new
    @student_form.assign_attributes(params[:form])
    if @student_form.save
      redirect_to action: "index"
    else
      redirect_to action: "new"
    end
  end

  def update
    @student_form = Teacher::StudentForm.new(StudentMember.find(params[:id]))
    @student_form.assign_attributes(params[:form])
    if @student_form.save
      redirect_to action: "index"
    else
      render action: "edit"
    end
  end

  def destroy
    student_member = StudentMember.find(params[:id])
    student_member.destroy!
    redirect_to :teacher_student_members
  end
end