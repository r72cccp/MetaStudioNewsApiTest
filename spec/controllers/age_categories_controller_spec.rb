# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AgeCategoriesController, type: :controller do
  let(:user) { create(:user) }
  let(:headers) { { Authorization: AuthenticateUser.call(user.email, user.password).result } }

  describe 'GET /index' do
    context 'when age categories list' do
      it 'must return list of not empty strings' do
        request.headers.merge! headers
        get :index
        expect(response.body.length).to be_positive
      end
    end

    context 'when list of age categories' do
      it 'must return serialized age_categories list' do
        request.headers.merge! headers
        get :index
        expect(JSON.parse(response.body)[0].keys).to eq(['value'])
      end
    end
  end
end
