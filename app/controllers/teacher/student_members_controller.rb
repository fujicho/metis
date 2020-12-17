class Teacher::StudentMembersController < Teacher::Base
  def index
    @student_members = StudentMember.order(:grade, :a_class).page(params[:page])
  end

  def show
    @student_member = StudentMember.find(params[:id])
  end

  def new
    # @student_form = Teacher::StudentForm.new
    @student_member = StudentMember.new
  end
  
  def edit
    # @student_form = Teacher::StudentForm.new(StudentMember.find(params[:id]))
    @student_member = StudentMember.find(params[:id])
  end

  def create
    @student_member = StudentMember.new(teacher_student_params)
    if @student_member.save
      flash.notice = "学生アカウントを新規登録しました。"
      redirect_to :teacher_student_members
    else
      render action: "new"
    end
  end

  def update
    @student_member = StudentMember.find(params[:id])
    @student_member.assign_attributes(teacher_student_params)
    if @student_member.save
      redirect_to :teacher_student_members
    else
      render action: "edit"
    end
  end

  def destroy
    student_member = StudentMember.find(params[:id])
    staff_member.destroy!
    redirect_to :teacher_student_members
  end

  private def teacher_student_params
    params.require(:student_member)
      .permit(:student_number,:family_name,:given_name,
        :family_name_kana,:given_name_kana,:gender,:email,:grade,:a_class,:password,:emergency_contact,
        :telephone_number,:homeroom_teacher,:start_date,:graduation_date,:suspended)
  end
end