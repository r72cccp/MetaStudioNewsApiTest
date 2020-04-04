# frozen_string_literal: true

require 'rails_helper'

RSpec.describe NewsCategory, type: :model do
  context 'with list of news categories' do
    it 'has numbers of items' do
      expect(described_class.all.length).to be_positive
    end
  end
end
