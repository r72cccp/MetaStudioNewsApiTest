# frozen_string_literal: true

class AgeCategoriesController < ApplicationController
  # GET /age_categories
  def index
    @age_categories = AgeCategory.all

    render json: @age_categories, each_serializer: AgeCategorySerializer
  end
end
