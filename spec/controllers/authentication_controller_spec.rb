# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AuthenticationController, type: :controller do
  let(:user) { create(:user) }

  describe 'POST /authenticate' do
    let(:valid_params) do
      {
        email: user.email,
        password: user.password,
      }
    end

    let(:invalid_params) do
      {
        email: user.email,
        password: "__#{user.password}__",
      }
    end

    context 'when user authenticate' do
      it 'must return valid token on success auth' do
        post :authenticate, params: valid_params
        expect(response).to have_http_status(:ok)
      end

      it 'must return bad_request if password incorrect' do
        post :authenticate, params: invalid_params
        expect(response).to have_http_status(:bad_request)
      end
    end
  end
end
