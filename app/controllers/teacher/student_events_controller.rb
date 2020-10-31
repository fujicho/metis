class Teacher::StudentEventsController < Teacher::Base
  def index
    if params[:student_member_id]
      @student_member = StudentMember.find(params[:student_member_id])
      @events = @student_member.events.order(occured_at: :desc)
    else
      StudentEvent.order(occured_at: :desc)
    end
  end
end
