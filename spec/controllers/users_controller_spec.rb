# frozen_string_literal: true

require 'rails_helper'

RSpec.describe UsersController, type: :controller do
  let(:user) { create(:user) }
  let(:new_user) { build(:user) }
  let(:headers) { { Authorization: AuthenticateUser.call(user.email, user.password).result } }

  describe 'GET /current_user' do
    context 'when user is not authenticated' do
      it 'must return unauthorized status' do
        get :get_current_user
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when user is authenticated by wrong token' do
      it 'must response with unauthorized status' do
        request.headers.merge! Authorization: '---wrong_token---'
        get :get_current_user, params: {}
        expect(response).to have_http_status(:unauthorized)
      end
    end

    context 'when user is authenticated' do
      it 'must response with 200 status' do
        request.headers.merge! headers
        get :get_current_user, params: {}
        expect(response).to have_http_status(:success)
      end
    end
  end

  describe 'POST /users' do
    let(:valid_params) do
      {
        user: {
          email: new_user.email,
          name: new_user.name,
          password: new_user.password,
          password_confirmation: new_user.password,
        },
      }
    end

    let(:invalid_params) do
      {
        user: {
          email: new_user.email,
          name: new_user.name,
          password: new_user.password,
          password_confirmation: "_#{new_user.password}_",
        },
      }
    end

    context 'when creating user and check the status' do
      it 'must response with 200 status' do
        post :create, params: valid_params
        expect(response).to have_http_status(:success)
      end
    end

    context 'when creating user and check response' do
      it 'must return serialized user instance' do
        post :create, params: valid_params
        expect(JSON.parse(response.body.as_json)['email']).to eq(new_user.email)
      end
    end

    context 'when creating user with invalid params' do
      it 'must response with unprocessable_entity status' do
        post :create, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
