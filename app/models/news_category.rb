# frozen_string_literal: true

class NewsCategory
  include ActiveModel::Validations
  include ActiveModel::Conversion
  include ActiveModel::Serialization
  extend ActiveModel::Naming

  attr_accessor :value

  validates :value, presence: true

  def initialize(attributes)
    attributes.each do |name, value|
      send "#{name}=", value
    end
  end

  def self.all
    @all ||= ENV['NEWS_CATEGORIES'].split(',').map do |news_category|
      NewsCategory.new(value: news_category)
    end
  end
end
