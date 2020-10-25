shared_examples "a protected teacher controller" do |controller|

  let(:args) do
    {
      host: Rails.application.config.metis[:teacher][:host],
      controller: controller
    }
  end

  describe "#index" do
    example "ログインフォームにリダイレクト" do
      get url_for(args.merge(action: :index))
      expect(response).to redirect_to(teacher_login_url)
    end
  end

  describe "#show" do
    example "ログインフォームにリダイレクト" do
      get url_for(args.merge(action: :show, id:1 ))
      expect(response).to redirect_to(teacher_login_url)
    end
  end
end

shared_examples "a protected singular teacher controller" do |controller|
  let(:args) do
    {
      host: Rails.application.config.metis[:teacher][:host],
      controller: controller
    }
  end

  describe "#show" do
    example "ログインフォームにリダイレクト" do
      get url_for(args.merge(action: :show, id:1))
      expect(response).to redirect_to(teacher_login_url)
    end
  end
end