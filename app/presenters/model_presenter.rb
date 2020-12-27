class ModelPresenter
  include HtmlBuilder

  attr_reader :object, :view_context
  delegate :raw, :link_to, to: :view_context

  def initialize(object,view_context)
    @object = object
    @view_context = view_context
  end

  def full_name
    object.family_name + " " + object.given_name
  end

  def full_name_kana
    object.family_name_kana + " " + object.given_name_kana
  end

  def gender
    case object.gender
    when "male"
      "男性"
    when "female"
      "女性"
    else
      ""
    end
  end
end