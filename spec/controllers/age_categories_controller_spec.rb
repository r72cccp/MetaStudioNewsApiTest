# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AgeCategoriesController, type: :controller do
  let(:user) { create(:user) }

  describe 'GET /index' do
    context 'when age categories list' do
      it 'must return list of not empty strings' do
        get :index
        expect(response.body.length).to be > 0
      end
    end

    context 'when list of age categories' do
      it 'must return serialized age_categories list' do
        get :index
        expect(JSON.parse(response.body)[0].keys).to eq(['value'])
      end
    end
  end
end
