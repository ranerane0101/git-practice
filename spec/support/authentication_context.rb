RSpec.shared_context "authentication" do
    def login(user)
      post "/api/login", params: { user: { email: user.email, password: user.password } }
    end
  end