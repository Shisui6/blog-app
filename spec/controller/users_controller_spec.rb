RSpec.describe 'Users', type: :request do
  describe 'GET #index' do
    before(:example) { get users_path }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
  end

  describe 'GET #show' do
    before(:example) do
      user = User.create(name: 'Tom', photo: 'https://unsplash.com/photos/F_-0BxGuVv', bio: 'Teacher', posts_counter: 0)
      get user_path id: user.id
    end

    after(:example) do
      Post.destroy_all
      User.destroy_all
    end

    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'show' template" do
      expect(response).to render_template('show')
    end
  end
end
