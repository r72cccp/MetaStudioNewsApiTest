# frozen_string_literal: true

class AgeCategoriesController < ApiController
  def index
    @age_categories = AgeCategory.all

    render json: @age_categories, each_serializer: AgeCategorySerializer
  end
end
