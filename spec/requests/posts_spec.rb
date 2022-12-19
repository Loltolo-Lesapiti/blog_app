require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    before(:example) { get '/users/1/posts' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the index template' do
      expect(response).to render_template('index')
    end
    it 'should includes the static text' do
      expect(response.body).to include('List of all the posts')
    end
  end

  describe 'GET /show' do
    before(:example) { get '/users/1/posts/1' }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders the show template' do
      expect(response).to render_template('show')
    end
    it 'should includes the static text' do
      expect(response.body).to include('This is a post made by a user')
    end
  end
end
