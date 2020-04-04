# frozen_string_literal: true

class AgeCategory
  include WithoutTable

  attr_accessor :value

  def self.all
    @all ||= ENV['AGE_CATEGORIES'].split(',').map do |age_category|
      AgeCategory.new(value: age_category.strip)
    end
  end
end
