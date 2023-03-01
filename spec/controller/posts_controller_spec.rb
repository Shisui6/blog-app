RSpec.describe 'Posts', type: :request do
  describe 'GET #index' do
    before(:example) { get '/users/1/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('index')
    end
    it 'contains the correct placeholder text' do
      expect(response.body).to include('Here is a list of all posts for a user')
    end
  end

  describe 'GET #show' do
    before(:example) { get '/users/1/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it "renders 'index' template" do
      expect(response).to render_template('show')
    end
    it 'contains the correct placeholder text' do
      expect(response.body).to include('Here is the info for a particular post')
    end
  end
end
