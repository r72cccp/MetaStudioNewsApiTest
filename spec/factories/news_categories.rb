# frozen_string_literal: true

NEWS_CATEGORIES = %w[Авто Здоровье Финансы Происшествия].freeze

FactoryBot.define do
  factory :news_category, class: 'NewsCategory' do
    value { NEWS_CATEGORIES.sample }
  end
end
