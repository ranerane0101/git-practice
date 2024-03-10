require 'rails_helper'

RSpec.describe Api::UsersController, type: :controller do
  describe 'POST #create' do
    context 'with valid params' do
      # Todo　FactoryBotにする
      let(:valid_params) { { user: { name: 'Test User', email: 'test@example.com', password: 'password' } } }

      it 'creates a new user' do
        expect {
          post :create, params: valid_params
        }.to change(User, :count).by(1)
      end

      it 'returns a success response with user data' do
        post :create, params: valid_params
        # Todo committee
        expect(response).to have_http_status(:success)
        expect(JSON.parse(response.body)['user']['name']).to eq('Test User')
        expect(JSON.parse(response.body)['user']['email']).to eq('test@example.com')
      end
    end

    context 'with invalid params' do
      # Todo FactoryBot
      let(:invalid_params) { { user: { name: '', email: '', password: '' } } }

      it 'returns an unprocessable entity response with errors' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
        expect(JSON.parse(response.body)['errors']).to be_present
      end
    end
  end

  
end
