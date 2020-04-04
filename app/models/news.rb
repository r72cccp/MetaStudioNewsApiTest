# frozen_string_literal: true

class News < ApplicationRecord
  include WithPagination
  belongs_to :user

  validates :title, presence: true
  validates :origin, presence: true
  validates :age_category, presence: true
  validates :news_category, presence: true
end
