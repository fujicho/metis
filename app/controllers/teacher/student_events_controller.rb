class Teacher::StudentEventsController < Teacher::Base
  def index
    if params[:student_member_id]
      @student_member = StudentMember.find(params[:student_member_id])
      @events = @student_member.events
    else
      @events = StudentEvent
    end
    @events = @events.order(occurred_at: :desc).includes(:member).page(params[:page])
  end
end
