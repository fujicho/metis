class Teacher::StudentMembersController < Teacher::Base
  def index
    @student_members = StudentMember.order(:grade, :a_class)
  end

  def show
    staff_member = StaffMember.find(params[:id])
    redirect_to [ :edit, :teacher, staff_member]
  end

  def new
    @student_member = StudentMember.new
  end
  
  def edit
    @student_member = StudentMember.find(params[:id])
  end

  def create
    @student_member = StudentMember.new(params[:student_member])
    if @student_member.save
      flash.notice = "学生アカウントを新規登録しました。"
      redirect_to :teacher_student_members
    else
      render action: "new"
    end
  end

  def update
    @student_member = StaffMember.find(params[:id])
    @student_member.assign_attributes(params[:student_member])
    if @student_member.save
      redirect_to :teacher_student_members
    else
      render action: "edit"
    end
  end
end