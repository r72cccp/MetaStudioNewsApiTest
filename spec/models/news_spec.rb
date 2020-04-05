# frozen_string_literal: true

require 'rails_helper'

RSpec.describe News, type: :model do
  let(:new_news) { build(:news) }
  let(:news) { create(:news) }

  context 'with news' do
    it 'has title' do
      expect(new_news.title).not_to be_empty
    end

    it 'has html' do
      expect(new_news.html_content).to match(/<[^>]+>/)
    end
  end

  context 'when updating news' do
    it 'must change attribute value' do
      new_news_title = 'new News title'
      news.update(title: new_news_title)
      expect(news.title).to eq(new_news_title)
    end
  end

  context 'when destroy existed news' do
    it 'must not find that news again' do
      existed_news_id = news.id
      news.destroy
      not_existed_news = described_class.find_by(id: existed_news_id)
      expect(not_existed_news).to be_nil
    end
  end
end
