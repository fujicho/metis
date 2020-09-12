module ApplicationHelper
  def browser_name
    if @title.present?
      "#{@title} - Metis"
    else
      "Metis"
    end
  end
end
