require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    it 'tests if index works' do
      get '/users/1/posts'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Software Development')
      expect(response).to render_template(:index)
    end
  end

  describe 'posts#show' do
    it 'tests if show works' do
      get '/users/1/posts/4'
      expect(response).to have_http_status(:ok)
      expect(response.body).to include('Collaboration')
      expect(response).to render_template(:show)
    end
  end
end
