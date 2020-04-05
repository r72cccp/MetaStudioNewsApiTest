# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsController, type: :controller do
  let(:user) { create(:user) }
  let(:news) { create(:news) }
  let(:new_news) { build(:news) }
  let(:news_list) { create_list(:news, 100) }
  let(:headers) { { Authorization: AuthenticateUser.call(user.email, user.password).result } }

  describe 'GET /news' do
    context 'when page number is missed than returns the first page' do
      it 'must response with success status' do
        request.headers.merge! headers
        get :index, params: { metadata: { page_number: 1 } }
        expect(response).to have_http_status(:success)
      end

      it 'must contains response metadata' do
        request.headers.merge! headers
        get :index, params: { metadata: { page_number: 1 } }
        expect(JSON.parse(response.body)).to be_key('meta')
      end
    end
  end

  describe 'POST /news' do
    let(:valid_params) do
      {
        age_category: new_news.age_category,
        html_content: new_news.html_content,
        news_category: new_news.news_category,
        origin_url: new_news.origin_url,
        origin: new_news.origin,
        title: new_news.title,
      }
    end

    context 'when creating news and check response' do
      it 'must return serialized news instance' do
        request.headers.merge! headers
        post :create, params: valid_params
        expect(JSON.parse(response.body)['title']).to eq(new_news.title)
      end
    end

    context 'when update existed news' do
      it 'must response with updated news' do
        new_news_title = 'new News title'
        request.headers.merge! headers
        put :update, params: { id: news.id, title: new_news_title }
        expect(JSON.parse(response.body)['title']).to eq(new_news_title)
      end
    end

    context 'when destroy existed news' do
      it 'must response with status ok' do
        request.headers.merge! headers
        delete :destroy, params: { id: news.id }
        expect(response).to have_http_status(:ok)
      end
    end
  end
end
