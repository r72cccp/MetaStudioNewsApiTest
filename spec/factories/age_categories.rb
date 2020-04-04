# frozen_string_literal: true

AGE_CATEGORIES = %w[6+ 12+ 16+ 18+].freeze

FactoryBot.define do
  factory :age_category, class: 'AgeCategory' do
    value { AGE_CATEGORIES.sample }
  end
end
