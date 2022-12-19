require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    before(:example) { get users_path(1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
      expect(response).to render_template('index')
      expect(response.body).to include('Users page')
    end
    it 'renders index template' do
      expect(response).to render_template('index')
    end
    it 'should include the static text' do
      expect(response.body).to include('Users page')
    end
  end

  describe 'GET /show' do
    before(:example) { get user_path(1) }
    it 'is a success' do
      expect(response).to have_http_status(:ok)
    end
    it 'renders show template' do
      expect(response).to render_template('show')
    end
    it 'should include the static text' do
      expect(response.body).to include('This is User details')
    end
  end
end
