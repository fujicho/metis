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
end
