# frozen_string_literal: true

class NewsCategoriesController < ApiController
  def index
    @news_categories = NewsCategory.all
    render json: @news_categories, each_serializer: NewsCategorySerializer
  end
end
