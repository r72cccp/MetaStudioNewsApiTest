# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News, type: :model do
  let(:news) { build(:news) }

  context 'with news' do
    it 'has title' do
      expect(news.title).not_to be_empty
    end

    it 'has html' do
      expect(news.html_content).to match(/<[^>]+>/)
    end
  end
end
