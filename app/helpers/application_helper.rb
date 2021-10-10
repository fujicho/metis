module ApplicationHelper
  def browser_name
    if @title.present?
      "#{@title} - Metis"
    else
      "Metis"
    end
  end

  def answer_closed?
    params[:answer][:question][:closed]
  end
end
