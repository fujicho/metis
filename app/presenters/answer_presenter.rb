class AnswerPresenter < ModelPresenter
  delegate :body , to: :object

  def posted_at
    "投稿日 " + object.created_at.strftime('%Y/%m/%d')
  end
end