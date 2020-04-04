# frozen_string_literal: true

class NewsCategory
  include WithoutTable

  attr_accessor :value

  validates :value, presence: true

  def self.all
    @all ||= ENV['NEWS_CATEGORIES'].split(',').map do |news_category|
      NewsCategory.new(value: news_category.strip)
    end
  end
end
