# frozen_string_literal: true

class NewsListItemSerializer < ActiveModel::Serializer
  attributes :age_category, :created_at, :id, :html_content, :news_category, :origin, :origin_url, :title
end
