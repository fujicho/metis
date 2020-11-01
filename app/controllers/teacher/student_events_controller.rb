class Teacher::StudentEventsController < Teacher::Base
  def index
    if params[:student_member_id]
      @student_member = StudentMember.find(params[:student_member_id])
      @events = @student_member.events.order(occurred_at: :desc)
    else
      @events = StudentEvent.order(occurred_at: :desc)
    end
  end
end
