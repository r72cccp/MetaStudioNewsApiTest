# frozen_string_literal: true

FactoryBot.define do
  factory :news, class: 'News' do
    user
    origin { Faker::Book.publisher }
    origin_url { Faker::Internet.url }
    sequence(:html_content) do |n|
      "<div><p>#{n} - #{Faker::Name.name_with_middle}</p><p>#{Faker::Lorem.paragraph(sentence_count: 2)}</p></div>"
    end
    age_category
    news_category
    sequence(:title) { |n| "News #{n}: #{Faker::Book.title}" }
  end
end
